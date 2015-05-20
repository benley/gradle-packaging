SHELL := /bin/bash

all: deb

deb:
	./gradle-mkdeb.sh

clean:
	rm -rf ./build/
	rm -f ./*.deb
