abspath_to_makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(patsubst %/,%,$(dir $(abspath_to_makefile)))

.PHONY: all
all: build

.PHONY: build
build:
	docker build --pull --tag eightycolumns/express:4.15.4 $(makefile_dir)

bin_dir := $(HOME)/bin
executable := express

.PHONY: install
install: | $(bin_dir)
	cp -f $(makefile_dir)/$(executable) $(bin_dir)/$(executable)

$(bin_dir):
	mkdir -p $@

.PHONY: uninstall
uninstall:
	rm -f $(bin_dir)/$(executable)
