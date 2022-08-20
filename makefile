APPS =
MYUSER = $(shell whoami)
DIR = $(shell pwd)
TAG_NAME = ppd:latest
V =

ifeq (V, 1)
	V=
else
	V=@
endif

.PHONY: all build shell

all : build shell

build:
	$(V)sudo docker build --build-arg my_user=$${USER} --build-arg USER_UID=$(shell id -u) --build-arg USER_GID=$(shell id -g) --build-arg USER_NAME=$(shell id -un) -t $(TAG_NAME) - < Dockerfile

shell :
	$(V)sudo make --no-print-directory docker CMD="/bin/bash -i"

docker :
	$(V)sudo docker run -it \
		--hostname=hostppd \
		-v $(DIR):/root/ \
		-v /home/$(MYUSER)/development:/root/development/ \
		$(TAG_NAME) $(CMD)
