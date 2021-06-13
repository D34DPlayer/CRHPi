include .env

DC = docker-compose

define HELP
Setup CRHPi

Commands:
---------
	build		- Build the images.
	setup		- Initial setup.
	start		- Start the containers.
	stop		- Stop the containers.
	logs		- Show the containers' logs.
endef

build:
	@$(DC) build

start up:
	$(DC) up -d

stop down:
	$(DC) down -t 5

setup:
	$(DC) run openvpn ovpn_initpki

logs:
	$(DC) logs -f
