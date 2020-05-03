SHELL = /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NPM_DIR := $(HOME)/.npm-global	
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

all: ubuntu-core basics packages

ubuntu-core: 
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -f
	sudo apt-get install -y build-essential

repo-add:
	sudo add-apt-repository -y ppa:aacebedo/fasd
	sudo add-apt-repository -y ppa:twodopeshaggy/jarun
	
basics:
	sudo apt -y install git git-extras
	sudo apt -y install curl
	sudo apt -y install stow
	sudo apt -y install aria2
	sudo apt -y install zsh

packages: frameworks apt-basics pip-packages node-packages gems

frameworks: brew npm python

apt-basics: basics
	sudo apt install -y $(shell cat install/aptfile)

apt-extras:
	sudo apt install -y $(shell cat install/aptextra)

link1:
	ln -sfn ~/.dotfiles/.bashrc ~/.bashrc
	ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
	ln -sfn ~/.dotfiles/.config/npm/.npmrc ~/.npmrc
	ln -sfn ~/.dotfiles/.config/git/.gitconfig ~/.gitconfig	
	ln -sfn ~/.dotfiles/.config/ ~/.config/

link2:
	rsync --exclude ".git/" \
		--exclude "Makefile" \
		--exclude "lib/" \
		--exclude "install/"
link: basics
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

unlink: basics
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew: basics
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh

python: basics
	sudo apt install -y python3
	sudo apt install -y python3-distutils
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	python3 ~/.local/bin/pip install -U pip
	rm get-pip.py
	
pip-packages: python
	python3 -m pip install --upgrade --user $(shell cat install/pipfile) 	
 	
npm:
	mkdir -pv ~/.npm-global
	sudo apt install -y nodejs 
	sudo apt install -y npm
	npm config set prefix '~/.npm-global'


brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

node-packages: npm
	npm install -g $(shell cat install/npmfile)

ruby: 
	sudo apt install -y ruby-full
	
gems: ruby
	sudo gem install $(shell cat install/gemfile)

