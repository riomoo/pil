# Stage 1: The Builder
# Use the latest Go image for building the web server and Hugo site
FROM golang:bookworm AS builder

# Install Hugo
# We'll use the latest Hugo version to match the latest Go version
RUN apt-get update && apt-get install -y wget xz-utils && rm -rf /var/lib/apt/lists/*

# Download the latest UPX binary directly from GitHub
RUN wget https://github.com/upx/upx/releases/download/v5.0.2/upx-5.0.2-amd64_linux.tar.xz
RUN tar -xf upx-5.0.2-amd64_linux.tar.xz && mv upx-5.0.2-amd64_linux/upx /usr/local/bin/upx && rm -r upx-5.0.2-amd64_linux upx-5.0.2-amd64_linux.tar.xz

# Create a simple Go web server
WORKDIR /app

# Add the server code
COPY server.go .

# Build the Go server binary statically
# CGO_ENABLED=0 ensures the binary is self-contained and will run in the distroless image
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags="-s -w -extldflags '-static' -X main.GOMEMLIMIT=50MiB -X runtime.defaultGOGC=150" -trimpath -gcflags="-l=4" -asmflags=-trimpath -o /server server.go
RUN upx --best --ultra-brute /server
RUN chmod +x /server

# Copy your Hugo site's source files
COPY . /src

# Stage 2: The Final, Distroless Image
# Use the minimal distroless/base image
FROM cgr.dev/chainguard/static:latest

# Set the working directory to where the content will live
WORKDIR /www

# Copy the generated Hugo site from the builder stage
COPY --from=builder /src/public /www

# Copy the statically-compiled web server binary from the builder stage
COPY --from=builder /server /server

# Expose the port the server will listen on
EXPOSE 8080

# The command to run the statically-compiled web server binary
# ENTRYPOINT must be in vector form since there is no shell
ENTRYPOINT ["/server"]
