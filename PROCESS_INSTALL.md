ubuntu lts secure install and config

- create installation media

- install from official image with the wipe old installs

- configure account and do process wizard

- BEFORE YOU CONNECT INTERNET enable ufw
	- `ufw enable`
	- `ufw default deny incoming`

- BEFORE YOU CONNECT INTERNET disable daemons you do not plan to use
	- `apt-get remove remmina` (who want to share desktop?)
	- `apt-get autoremove && apt-get autoclean` (clean up)
	- ... etc

- connect internet

- download update and install thing
    - `apt-get update && apt-get upgrade`
	- `apt-get install xsel` (to use password copy to clipboard)
	- `apt-get install macchanger` (to change mac for wireless, untrusted ethernet)

- more resource:
	URL: http://www.insanitybit.com/2012/12/17/hardening-ubuntu-linux/
	URL: http://blog.internot.info/2014/06/securing-ubuntu-desktop-from-bad-guys.html
