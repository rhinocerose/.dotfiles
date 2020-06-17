SHELL = /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NPM_DIR := $(HOME)/.npm-global	
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

all: basics packages link

basics:
	sudo pacman -Syu 
	mkdir -pv ~/.npm-global
	bash install/pac.sh install/basefile
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay && makepkg -si	
	
packages: pacman-packages pip-packages node-packages gems

pacman-packages:
	bash install/pac.sh install/pacfile
	bash install/pac.sh install/fontfile
	bash install/pac.sh install/docufile
	bash install/pac.sh install/buildfile
	bash install/yay.sh install/yayfile
	git clone https://github.com/rhinocerose/just-colors ~/.config/just-colors/
	cd ~/.config/just-colors && make install


extra:
	bash install/pac.sh install/aptextra
	git clone https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
	cd ~/.nerd-fonts
	./install.sh
	cd ~/.dotfiles

server:
	bash install/pac.sh install/serverfile
	bash install/openeatsinstall.sh
	bash install/plexinstall.sh
	sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	sudo systemctl enable mysqld
	sudo systemctl start mysqld
	sudo mysql_secure_installation

link:
	bash install/link.sh

shell:
	sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
	curl -L https://get.oh-my.fish | fish
	omf install spacefish
	omf install agnoster
	omf theme agnoster
	chsh --shell /bin/fish
	source ~/config.sh

stowlink: basics
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then mv -v $(HOME)/$$FILE{,.bak}; fi; done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

stowunlink: basics
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done

brew: 
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby

pip-packages: 
	bash install/pip.sh install/pipfile	
 	
brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

node-packages: 
	npm config set prefix '~/.npm-global'
	npm install -g $(shell cat install/npmfile)

gems: 
	sudo gem install $(shell cat install/gemfile)
