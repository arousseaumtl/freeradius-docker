APP_NAME := $(shell basename $(CURDIR))
build:
	docker build --rm -t $(APP_NAME):latest .
install:
	docker build --rm -t $(APP_NAME):latest .
all:
	docker build --rm -t $(APP_NAME):latest .