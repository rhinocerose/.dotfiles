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
