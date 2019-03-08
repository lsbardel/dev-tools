# Ubuntu Setup

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [General](#general)
- [Javascript](#javascript)
- [Docker](#docker)
- [Extensions](#extensions)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## General

* Run [./ubuntu.sh](./scripts/ubuntu.sh) from this directory

## Javascript

* Install [node.js][] as described by the [NodeSource](https://github.com/nodesource/distributions/blob/master/README.md) distribution
* Install ``yarn`` via ``sudo npm install -g yarn``.
* Check ``yarn`` global installation directory ``yarn global dir``

## Docker

* Create the ``docker`` group ``sudo groupadd docker``
* Add your user to the group ``sudo usermod -aG docker $USER``

from [get docker ce for ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/) run the following [docker.sh script](./docker.sh)

## Minikube

[Minikube](https://kubernetes.io/docs/setup/minikube/) is a tool that makes it easy to run Kubernetes locally. Minikube runs a single-node Kubernetes cluster inside a VM on your laptop for users looking to try out Kubernetes or develop with it day-to-day.

* Install [KVM](https://www.linux-kvm.org/page/Main_Page), Kernel-based Virtual Machine with [kvm.sh](./scripts/kvm.sh)
* Enable, start and verify the libvirtd service has started.
  ```
  sudo systemctl enable libvirtd.service
  sudo systemctl start libvirtd.service
  sudo systemctl status libvirtd.service
  ```
* Make sure your user is part of the ``libvirt`` group
  ```
  sudo usermod -a -G libvirt $(whoami)
  ```
* Install the docker machine driver via [kvm-driver.sh](./scripts/kvm-driver.sh)
* Install [minicube.sh](./scripts/minicube.sh)
* Set the driver ``minikube config set vm-driver kvm2``

## Extensions

* [razer-blade-stealth-linux](https://github.com/rolandguelle/razer-blade-stealth-linux)
* [Dracula theme for the term shell](https://github.com/dracula/gnome-terminal)

## Useful Commands

### Users and groups

* List all users ``cut -d: -f1 /etc/passwd``
* List all groups ``cut -d: -f1 /etc/group``
* List memebers of a group ``getent group groupname | awk -F: '{print $4}'``
* Add a new group ``groupadd groupname``
* Add user to group ``usermod -aG examplegroup exampleusername``
* Add your user to group ``usermod -aG examplegroup $USER`` (same as above)

[node.js]: https://nodejs.org/en/