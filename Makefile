SHELL = /bin/bash
HUGO_VERSION = 0.55.1

clean:
	rm -rf exampleSite/public

BINARY_OS := $(shell uname | sed 's/Darwin/macOS/')

install_hugo:
	curl --fail -L https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_$(HUGO_VERSION)_$(BINARY_OS)-64bit.tar.gz | \
		tar --overwrite -C /usr/local/bin -xvzf - hugo

build: clean
	cd exampleSite && hugo --config config.toml

start:
	hugo --config config.toml -s ./exampleSite server
