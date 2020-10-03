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
	git add -A; and git commit -m 'quick commit'; and git push origin master
end
