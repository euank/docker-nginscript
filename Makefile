NGINX_VERSION:=1.13.1
NJS_VERSION:=0.1.10

DOCKERFILE_VERSION:=1

LATEST:=true

all:
	NGINX_VERSION=$(NGINX_VERSION) NJS_VERSION=$(NJS_VERSION) gotmpl Dockerfile.tmpl > Dockerfile
	docker build -t euank/docker-nginscript:$(NGINX_VERSION)-$(NJS_VERSION)-$(DOCKERFILE_VERSION) .
ifeq ($(LATEST),true)
	docker tag euank/docker-nginscript:$(NGINX_VERSION)-$(NJS_VERSION)-$(DOCKERFILE_VERSION) euank/docker-nginscript:latest
endif
	echo Built euank/docker-nginscript:$(NGINX_VERSION)-$(NJS_VERSION)-$(DOCKERFILE_VERSION) .

push: 
	docker push euank/docker-nginscript:$(NGINX_VERSION)-$(NJS_VERSION)-$(DOCKERFILE_VERSION)
ifeq ($(LATEST), true)
	docker push euank/docker-nginscript:latest
endif
