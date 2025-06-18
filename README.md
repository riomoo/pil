<div align="center">

# Prism Information License

</div>

## License

[![Custom badge](https://img.shields.io/endpoint?style=for-the-badge&url=https%3A%2F%2Fshare.jester-designs.com%2Fmedia%2Fbank%2Fkeep%2Fpil.json)](LICENSE)

## Project Template

* README (this file)
* [PIL License](LICENSE)

## What is it?
This is a software licence designed for those that not only wish to share their software but share the information about how it works from the front to the back like a prism.

## About
- This license can be Multi-Licensed with others.
- If your software doesn't use any other backends (NGINX, MariaDB, ETC) then only an explanation of how to use the software is required. (a manpage is enough so long as an example of how to use the software is included in the manpage)

## Why Choose This License?
- While most software licenses are great, MIT, (A)GPL, etc. Software licenses typically do not mandate providing detailed technical explanations of the software's internal workings in a way that's easily understandable for non-technical users.</p>
- This license requires a simple explanation on how to use said software and if said software works with the frontend and/or the backend to explain how that should work.
(Examples would be using said software with a custom CDN using NGINX, an NGINX config to be used with said software, or in conjunction with custom databases like MariaDB or other softwares you've written and/or not written)</p>

## How?
Use the following text in a LICENSE file or any project documentation:
```
# Prism Information License (PIL)
Copyright (c) [Year] [Your Name or Organization and/or Email]

This software is licensed under the Prism Information License (PIL).

- You are free to use, modify, and distribute this software.
- Any derivative work must include this license.
- You must also provide a concise explanation of how to operate this software,
  as well as backends and frontends (if any) that work with this software.
- You must credit the original creator of this software.
- You may choose to license this software under additional licenses, provided that the terms of the original PIL are still adhered to.

This software is provided "as is", without any warranty of any kind,
express or implied, including but not limited to the warranties of merchantability,
fitness for a particular purpose, and non-infringement.

By using this software, you agree to the terms of the PIL.
For more information visit: https://pil.jester-designs.com/
```
Or click for one of the templates:
- [PIL](www/docs/PIL.txt)
- [PIL+BGRS](www/docs/PILpBGRS.txt)

## Config for NGINX to use as a website:
```
server {
        listen 8080;
        listen [::1]:8080;
        server_name pil.example.com;
        root /srv/pil; # Upload Contents of www to this folder
        location / {
                access_log  /var/log/nginx/pil.access.log;
                index index.html;
        }
}
```

<div align="center">

## Software Used but not included

![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge)
![Gimp Gnu Image Manipulation Program](https://img.shields.io/badge/Gimp-657D8B?style=for-the-badge&logo=gimp&logoColor=FFFFFF)
![Vim](https://img.shields.io/badge/VIM-%2311AB00.svg?style=for-the-badge&logo=vim&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![Forgejo](https://img.shields.io/badge/forgejo-%23FB923C.svg?style=for-the-badge&logo=forgejo&logoColor=white)

</div>

## Creator:
- [Codeberg Riomoo](https://codeberg.org/riomoo)
- [GitGud Riomoo](https://gitgud.io/riomoo)
- [Github Riomoo](https://github.com/riomoo)
