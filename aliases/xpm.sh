#!/bin/bash

# Script Name: xpm

# Functions to check the environment

is_npm() {
	if [ -f "package-lock.json" ]; then
		return
	fi

	false
}

is_pnpm() {
	if [ -f "pnpm-lock.yaml" ]; then
		return
	fi

	false
}

is_yarn() {
	if [ -f "yarn.lock" ]; then
		return
	fi

	false
}

function install_package() {
	if is_npm; then
		echo "Installing with npm."
		npm install "$@"
	elif is_yarn; then
		echo "Installing with yarn."
		yarn install "$@"
	elif is_pnpm; then
		echo "Installing with pnpm."
		pnpm install "$@"
	else
		echo "No package manager found, defaulting to npm."
		npm install "$@"
	fi
}

function run_script() {
	if is_npm; then
		echo "Running $@ with npm."
		npm "$@"
	elif is_yarn; then
		echo "Running $@ with yarn."
		yarn "$@"
	elif is_pnpm; then
		echo "Running $@ with pnpm."
		pnpm "$@"
	else
		echo "Running $@ with npm by default."
		npm "$@"
	fi
}

# if [ $# -eq 0 ]; then
# 	echo "No command given"
# elif [ "$1" == "install" ]; then
# 	install_package "${@:2}"
# else
# 	run_script "$@"
# fi

run_script "$@"