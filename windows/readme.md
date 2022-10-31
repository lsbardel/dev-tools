# Windows WSL2

## docker

* install [docker-credential-helpers.exe](https://github.com/docker/docker-credential-helpers) in a directory, say `C:\Packages` and add this directory in the windows PATH
* in wsl create a soft link `ln -s /mnt/c/Packages/docker-credential-wincred.exe docker-credential-desktop.exe`
* restart wsl via `wsl --shotdown`

[wsl2]
memory=8GB
swap=0
localhostForwarding=true
processors=4
