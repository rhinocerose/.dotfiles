SHELL = /bin/bash
DOTFILES_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
NPM_DIR := $(HOME)/.npm-global
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

all: basics packages link

basics:
	sudo pacman -Syyu
	mkdir -pv ~/.npm-global
	bash install/pac.sh install/basefile
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay && makepkg -si

packages: pacman-packages pip-packages node-packages gems

pacman-packages:
	bash install/pac.sh install/pacfile
	bash install/pac.sh install/fontfile
	rm -rf ~/Downloads/fonts/
	git clone https://github.com/powerline/fonts ~/Downloads/fonts
	cd ~/Downloads/fonts && sudo cp */*.ttf /usr/share/fonts/TTF/
	rm -rf ~/Downloads/fonts/
	bash install/pac.sh install/docufile
	bash install/pac.sh install/buildfile
	yay -S polybar
	#yay -S tealdeer
	yay -S ripgrep-all
	yay -S ttf-font-awesome-4
	yay -S lightdm-mini-greeter
	git clone https://github.com/rhinocerose/just-colors ~/.config/just-colors/
	cd ~/.config/just-colors && sudo make install
	bash ~/.dotfiles/bin/appearance.sh loudpastel

extra:
	bash install/pac.sh install/aptextra
	git clone https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
	cd ~/.nerd-fonts && ./install.sh
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
	bash install/link.sh loudpastel

shell:
	#curl -fsSL https://get.oh-my.fish | fish
	curl -fsSL https://starship.rs/install.sh | bash
	chsh --shell /bin/fish
	source ~/config.fish

stowlink: basics
	for FILE in $$(\ls -A runcom);
	do
		if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ];
		then
			mv -v $(HOME)/$$FILE{,.bak};
		fi;
	done
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config

stowunlink: basics
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	for FILE in $$(\ls -A runcom);
	do
		if [ -f $(HOME)/$$FILE.bak ];
		then
			mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak};
		fi;
	done

pip-packages:
	bash install/pip.sh install/pipfile

node-packages:
	npm config set prefix '~/.npm-global'
	npm install -g $(shell cat install/npmfile)

gems:
	gem install $(shell cat install/gemfile)
