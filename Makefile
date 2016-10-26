GROUP=eavatar
NAME=builder
VERSION=0.1.7

.PHONY          : build tag all clean 

all: build tag

build: Dockerfile
	docker build -t $(GROUP)/$(NAME):$(VERSION) .

tag:
	@if ! docker images $(GROUP)/$(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker tag $(GROUP)/$(NAME):$(VERSION) $(GROUP)/$(NAME):latest

