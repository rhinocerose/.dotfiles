SHELL = /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NPM_DIR := $(HOME)/.npm-global	
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

all: basics packages link

basics:
	sudo pacman -Syu 
	sudo pacman -S --needed base-devel
	sudo pacman -S aria2 curl make stow zsh
	mkdir -pv ~/.npm-global
	sudo pacman -S python3 python-pip nodejs npm ruby code
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay && makepkg -si
	chsh --shell /bin/fish
	
packages: pacman-packages pip-packages node-packages gems

pacman-packages:
	sudo pacman -S ack alacritty cmake coreutils
	sudo pacman -S doxygen emacs falkon fasd figlet
	sudo pacman -S fish gucharmap htop i3-gaps imagemagick markdown
	sudo pacman -S meson neofetch ninja openssh otf-font-awesome pandoc
	sudo pacman -S powerline-fonts shellcheck texlive-core the_silver_searcher thefuck tree zsh
	yay -S polybar

extra:
	yes | sudo pacman -S - < install/aptextra
	git clone https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
	cd ~/.nerd-fonts
	./install.sh
	cd ~/.dotfiles

link:
	ln -sfn ~/.dotfiles/.bashrc ~/.bashrc
	ln -sfn ~/.dotfiles/.zshrc ~/.zshrc
	ln -sfn ~/.dotfiles/.config/npm/.npmrc ~/.npmrc
	ln -sfn ~/.dotfiles/.config/fish/config.sh ~/config.sh
	ln -sfn ~/.dotfiles/.config/git/.gitconfig ~/.gitconfig	
	ln -sfn ~/.dotfiles/.config/fish/ ~/.config/fish
#	ln -sfn ~/.dotfiles/.config/omf/ ~/.config/omf
	ln -sfn ~/.dotfiles/.config/npm/ ~/.config/npm
	ln -sfn ~/.dotfiles/.config/polybar/ ~/.config/polybar
	chmod +x ~/.config/polybar/launch.sh
#	ln -sfn ~/.dotfiles/.config/regolith/i3/ ~/.config
#	ln -sfn ~/.dotfiles/.config/i3status/ ~/.config/i3status
	ln -sfn ~/.dotfiles/.config/ssh/config ~/.ssh/
	ln -sfn ~/.dotfiles/.config/vim/ ~/
	source ~/config.sh
	
shell:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	curl -L https://get.oh-my.fish | fish
	omf install spacefish
	omf install agnoster
	omf theme agnoster
	source .zshrc

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
	python3 -m pip install --upgrade --user $(shell cat install/pipfile) 	
 	
brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile

node-packages: 
	npm config set prefix '~/.npm-global'
	npm install -g $(shell cat install/npmfile)

gems: 
	sudo gem install $(shell cat install/gemfile)
