# Latex

Docker image to run latex commands.
Docker file and scripts originally from [latex-docker](https://github.com/blang/latex-docker).

Build the Image:
```
make latex-image
```
This will take a while as it installs the ``lattexlive-full`` distribution in the image.
In the meantime you can install the scripis via
```
sudo make latex-install
```
which simply copy [latex/latexrun.sh](./latex/latexrun.sh) and
[latex/latexshell.sh](./latex/latexshell.sh) into ``/usr/local/bin/latexrun``.

## Usage

Build a document
```
latexrun latex main.tex
```
or a pdf
```
latexrun pdflatex main.tex
```