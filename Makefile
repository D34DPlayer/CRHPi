include .env

DC = docker-compose
USER ?= carlos

define HELP
Setup CRHPi

Global commands:
---------
	build		- Build the images.
	setup		- Initial setup.
	start		- Start the containers.
	stop		- Stop the containers.
	logs		- Show the containers' logs.

VPN:
----
	vpn-create USER=XXX	- Create VPN user.
	vpn-users			- List the VPN users.
	vpn-get USER=XXX	- Creates a file to connect as a VPN user.
	vpn-remove USER=XXX	- Remove VPN user.
endef
export HELP

help:
	@echo "$$HELP"

build:
	@$(DC) build

start up:
	$(DC) --compatibility up -d

stop down:
	$(DC) down -t 5

setup:
	$(DC) run openvpn ovpn_initpki

logs:
	$(DC) logs -f

vpn-create:
	$(DC) exec openvpn easyrsa build-client-full $(USER) nopass

vpn-users:
	$(DC) exec openvpn ovpn_listclients

vpn-get:
	$(DC) exec openvpn ovpn_getclient $(USER) > $(USER).ovpn

vpn-remove:
	$(DC) exec openvpn ovpn_revokeclient $(USER)

