# Sublime Text

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Packages](#packages)
- [References](#references)
- [Install on Ubuntu](#install-on-ubuntu)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

* Install the [Package Control](https://packagecontrol.io/), **This should be the only package you have to install manually**
* ``Ctrl-Shift-P`` to access the Package Control
* My [sublime text setting](./Preferences.sublime-settings.json)

## Packages

* [python 3](https://packagecontrol.io/packages/Python%203)

## References

* [Setting up sublimetext for python](https://dbader.org/blog/setting-up-sublime-text-for-python-development)

[sublime text]: https://www.sublimetext.com/


## Install on Ubuntu

To install sublime text on ubuntu follow this [article](http://tipsonubuntu.com/2017/05/30/install-sublime-text-3-ubuntu-16-04-official-way/) or simply

* ``wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -``
* ``echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list``
* ``sudo apt-get update``
* ``sudo apt-get install sublime-text``
