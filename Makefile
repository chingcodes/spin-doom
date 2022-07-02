doom_files := $(wildcard doom-wasm/src/*.html) $(wildcard doom-wasm/src/*.cfg) $(wildcard doom-wasm/src/*.js) $(wildcard doom-wasm/src/*.wasm)

all: init build doom-site download

build: build-doom-wasm

download: site/doom1.wad

clean:
	-rm site/*

init:
	git submodule update --init

build-doom-wasm:
	doom-wasm/scripts/build.sh

doom-site: $(doom_files)
	cp $^ site/

site/doom1.wad:
	curl -o site/doom1.wad https://distro.ibiblio.org/slitaz/sources/packages/d/doom1.wad


.PHONY: all clean init build download build-doom-wasm
