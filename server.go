package main

import (
    "context"
    "net/http"
    "os"
    "os/signal"
    "syscall"
    "time"
)

func main() {
    server := &http.Server{
        Addr:    ":8080",
        Handler: http.FileServer(http.Dir("/www")),
    }

    go server.ListenAndServe()

    c := make(chan os.Signal, 1)
    signal.Notify(c, syscall.SIGINT, syscall.SIGTERM)
    <-c

    ctx, cancel := context.WithTimeout(context.Background(), time.Second)
    defer cancel()
    server.Shutdown(ctx)
}
