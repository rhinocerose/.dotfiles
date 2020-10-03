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
	nmcli device wifi connect "$argv" password 5e369c99a4
end

function wifiwork
    nmcli device wifi connect Rocketworx password !tWorxGr8
end

function wifi
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
