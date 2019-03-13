
.PHONY: help deploy

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


latex-image:	## Run deveoplment server with live reload
	docker build --file latex/Dockerfile -t latex latex

latex-install:	## Add latexrun command to /usr/local/bin directory
	cp latex/latexrun.sh /usr/local/bin/latexrun
	cp latex/latexshell.sh /usr/local/bin/latexshell