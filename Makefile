SHELL = /bin/bash
HUGO_VERSION = 0.97.3

clean:
	rm -rf exampleSite/public

BINARY_OS := $(shell uname | sed 's/Darwin/macOS/')

install_hugo:
	mkdir -p ./bin
	curl --fail -L https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_$(BINARY_OS)-64bit.tar.gz | \
		tar --overwrite -C ./bin -xvzf - hugo

build: clean
	./bin/hugo --config config.toml -s ./exampleSite

start:
	./bin/hugo --config config.toml -s ./exampleSite server
