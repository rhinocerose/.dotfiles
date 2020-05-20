SHELL = /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NPM_DIR := $(HOME)/.npm-global	
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

all: core basics packages rego-link

core: 
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -f
	sudo apt-get install -y build-essential
	
basics:
	sudo apt install -y $(shell cat install/basefile)
	sudo apt install -y zsh
	sudo apt install -y fish

apt-repo-add:
	sudo add-apt-repository -y ppa:aacebedo/fasd
	sudo add-apt-repository -y ppa:kgilmer/speed-ricer
	sudo apt update -y

packages: frameworks packages pip-packages node-packages gems

frameworks: shell
	mkdir -pv ~/.npm-global
	sudo apt install -y $(shell cat install/framefile)
	sudo apt install -y ruby-full

apt-packages: basics apt-repo-add
	sudo apt install -y $(shell cat install/aptfile)

apt-extra:
	sudo apt install -y $(shell cat install/aptextra)

rego-link:
	sudo apt install -y regolith-look-nord
	ln -sfn ~/.dotfiles/.bashrc ~/.bashrc
	ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
	ln -sfn ~/.dotfiles/.config/npm/.npmrc ~/.npmrc
	ln -sfn ~/.dotfiles/.config/fish/config.sh ~/config.sh
	ln -sfn ~/.dotfiles/.config/git/.gitconfig ~/.gitconfig	
	ln -sfn ~/.dotfiles/.config/fish/ ~/.config/fish
	ln -sfn ~/.dotfiles/.config/omf/ ~/.config/omf
	ln -sfn ~/.dotfiles/.config/npm/ ~/.config/npm
	ln -sfn ~/.dotfiles/.config/polybar/ ~/.config/polybar
	ln -sfn ~/.dotfiles/.config/i3/ ~/.config/i3
	mkdir -p ~/.ssh
	ln -sfn ~/.dotfiles/.config/ssh/config ~/.ssh/
	ln -sfn ~/.dotfiles/.config/regolith/ ~/.config/regolith
	ln -sfn ~/.dotfiles/.config/vim/ ~/
	ln -sfn ~/.dotfiles/.Xresources-regolith ~/.Xresources-regolith
	regolith-look refresh

shell:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	curl -L https://get.oh-my.fish | fish
	omf install spacefish
	omf install agnoster
	omf theme agnoster
	source .zshrc

link: basics
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

unlink: basics
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew: 
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

python: 
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
	python3 get-pip.py
	python3 ~/.local/bin/pip install -U pip
	rm get-pip.py
	
pip-packages: python
	python3 -m pip install --upgrade --user $(shell cat install/pipfile) 	
 	
brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

node-packages: 
	npm config set prefix '~/.npm-global'
	npm install -g $(shell cat install/npmfile)

gems: 
	sudo gem install $(shell cat install/gemfile)
