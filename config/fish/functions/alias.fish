##############################################################
# ARDUINO
##############################################################

function newsketch
    arduino-cli sketch new "$argv"
end

function nanobuild
    arduino-cli compile --fqbn arduino:avr:nano:cpu=atmega328 "$argv"
end

function nanoflash
    arduino-cli upload -P avrispmkii --fqbn arduino:avr:nano:cpu=atmega328 "$argv"
end

function nanodude
    avrdude -c avrisp2 -p m328p -U flash:w:build/arduino.avr.nano/"$argv"
end

function unobuild
    arduino-cli compile --fqbn arduino:avr:uno "$argv"
end

function unoflash
    sudo avrdude -c avrisp2 -p m328p -U flash:w:build/arduino.avr.uno/"$argv"
end


##############################################################
# BASH
##############################################################

function repoadd
    repo-add ~/customrepo/repo.db.tar.gz /home/arch/.cache/yay/*/*.pkg.tar.*
end

function f
    find . -name "$argv"
end

function grep
	rg -i "$argv"
end

function mkd
        mkdir -pv "$argv"; and cd "$argv"
end

function look
	bash ~/.dotfiles/bin/appearance.sh "$argv"
end

function cd
        if count $argv > /dev/null
                builtin cd "$argv"; and ll
        else
                builtin cd ~; and ll
        end
end

function link
	bash ~/.dotfiles/install/link.sh "$argv"
end

function xr
	xrandr --output VGA1 --primary --mode 1920x1080 --output LVDS1 --off
end

function reload
	source $HOME/config.fish
	source $HOME/.dotfiles/.config/fish/functions/alias.fish
end

function aledit
	vim $HOME/.dotfiles/.config/fish/functions/alias.fish
end

function vedit
	vim ~/.vim/vimrc
end

function fedit
	vim $HOME/config.fish
end

function dl
	cd ~/Downloads
end

function anss
    cd ~/ansible/.playbooks/ansible-server/
end

function ds
    cd /srv/salt
end

function dot
	cd $HOME/.dotfiles
end

function con
	cd ~/.config
end

function poly
	vim ~/.config/polybar/config
end

function ii
	vim ~/.config/i3/config
end

function fd
	ls -lah | rg -i "$argv"
end

function ll
	lsd -la
end

function ..
	cd ..
end

function ...
	cd ../..
end

function clr
	clear
end

function rr
	sudo rm -rf $argv
end

function kd
	kitty +kitten diff
end

function rename
	bash ~/.dotfiles/bin/rename.sh $argv
end


##############################################################
# GIT
##############################################################

function gitssh
    git remote set-url origin git@github.com:rhinocerose/"$argv"
end

function gitl
    git clone git@gitlab.com:"$argv"
end

function gith
    git clone git@github.com:"$argv"
end

function gp
	git push origin master
end

function gc
	git add -A; and git commit -m "$argv"
end


##############################################################
# PACMAN
##############################################################

function reflect
    sudo reflector --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
end

function api
	sudo pacman -S --noconfirm $argv
end

function apr
	sudo pacman -R $argv
end

function apu
	sudo pacman -Syu
end

function s3aur
    $HOME/aursync_wrapper "$argv"
end

##############################################################
# SSH
##############################################################

function static-ip
    nmcli con mod "$argv" ipv4.address "192.168.1.9/24"
    nmcli con mod "$argv" ipv4.gateway 192.168.1.1
    nmcli con mod "$argv" ipv4.dns "206.248.154.170"
    nmcli con mod "$argv" autoconnect yes
    nmcli con mod "$argv" ipv4.method manual
    nmcli con down "$argv"
    nmcli con up "$argv"
end

function wifiscan
	nmcli device wifi list
end

function wifihome
    wifiscan
	nmcli device wifi connect "$argv" password 5e369c99a4
end

function wifiwork
    wifiscan
    nmcli device wifi connect Rocketworx password !tWorxGr8
end

function wifi
    wifiscan
	nmcli device wifi connect "$arg1" password "$arg2"
end

function topi
	scp "$argv" rpi:~/Downloads/
end

function todesk
	scp "$argv" desk:~/Downloads/
end

function tohtpc
	scp "$argv" htpc:~/Downloads/
end

function tocse
	scp "$argv" cse:~/Downloads/
end

function ssh
	env TERM=xterm-256color ssh "$argv"
end


##############################################################
# TIZONIA
##############################################################

function yt
	tizonia --youtube-audio-search "$argv"
end

function gmtrack
    tizonia --gmusic-tracks "$argv"
end

function gmamrtist
    tizonia --gmusic-artist "$argv"
end

function sc
	tizonia --soundcloud-tracks "$argv"
end


##############################################################
# MISC
##############################################################

function canviz
    cd $HOME/Projects/rust/canviz/
    cargo build
    $HOME/Projects/rust/canviz/target/debug/canviz -i $HOME/Projects/rust/canviz/data/anzen.dbc vcan0
end

function canvext
    cd $HOME/Projects/rust/canviz/
    cargo build
    $HOME/Projects/rust/canviz/target/debug/canviz -r -i $HOME/Projects/rust/canviz/data/anzen.dbc vcan0
end

##############################################################
# MISC
##############################################################

function condinstall
    conda install -c conda-forge "$argv"
end

function gpgkey
    gpg --keyserver pool.sks-keyservers.net --recv-keys "$argv"
end

function cal
	gcalcli --cal ashar.k.latif@gmail.com  quick
end

function pb
	bash $HOME/.dotfiles/bin/pandoc/panbuild.sh $argv
end
