########################################
config.set('content.notifications', False, '*://reddit.com/')

########################################
# Location
########################################
config.set('content.geolocation', False, '*://*.canadiantire.com/')
config.set('content.geolocation', False, '*://*.homehardware.ca/')

c.content.geolocation = False 
c.content.notifications = False 

## List of URLs of lists which contain hosts to block.  The file can be
## in one of the following formats:  - An `/etc/hosts`-like file - One
## host per line - A zip-file of any of the above, with either only one
## file, or a file   named `hosts` (with any extension).  It's also
## possible to add a local file or directory via a `file://` URL. In case
## of a directory, all files in the directory are read as adblock lists.
## The file `~/.config/qutebrowser/blocked-hosts` is always read if it
## exists.
## Type: List of Url
c.content.host_blocking.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
