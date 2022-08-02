# Use GPG

* create an account on [keybase](keybase.io)
* generate a GPG key

## Install the secret key on a computer

In this way you can encrypt messages and commits.

* Go to keybase and click on the `edit` near the 64-bit key and click on `Eport my private key from keybase`
* Copy and paste the key into a file `private.key`
* Import the key via `gpg --import private.key`
* Check that the key is correctly installed via `gpg --list-secret-keys`

## Configure Github

configure github to sign commits

* Check github global config `git config --global -l`
* Add the key `git config --global user.signingkey <KEY-ID>`
* Enable signature `git config --global commit.gpgsign true`
