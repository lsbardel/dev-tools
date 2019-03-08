#!/bin/bash

# install docker machine driver for KVM
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2
install docker-machine-driver-kvm2 /usr/local/bin/