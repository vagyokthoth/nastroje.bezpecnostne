ubuntu 14.04.1 lts secure install and config

- grab image official

- disconnect from internet, disable wireless

- do verify iso signature

- while you have done that, research and make list of daemons you do use
	- `apt list --installed` > /path/to/saved.list

- create installation media

- install from official image with the wipe old installs

- configure account and do process wizard

- disable crappy services
    - `echo "manual" | sudo tee /etc/init/bluetooth.override`
    - `echo "manual" | sudo tee /etc/init/cups.override`
    - `echo "manual" | sudo tee /etc/init/cups-browsed.override`

- BEFORE YOU CONNECT INTERNET make cron ghostbuster
    - echo -ne "# m h  dom mon dow   command\n# call zee ghostbuster\n  * *   *   *   *    rm -rf ~/.local/share/zeitgeist 2>&1 > /dev/null\n" > /var/tmp/crontab.cron && crontab /var/tmp/crontab.cron

- BEFORE YOU CONNECT INTERNET enable ufw
	- `ufw enable`
	- `ufw default deny incoming`

- BEFORE YOU CONNECT INTERNET disable daemons you do not plan to use
	- `apt-get remove remmina` (who want to share desktop?)
	- `apt-get autoremove && apt-get autoclean` (clean up)
	- ... etc

- now is final time, connect internet

- download update and install thing
    - `apt-get update && apt-get upgrade`
	- `apt-get install xsel` (to use password copy to clipboard)
	- `apt-get install macchanger` (to change mac for wireless, untrusted ethernet)

- more resource:
	URL: http://www.insanitybit.com/2012/12/17/hardening-ubuntu-linux/
	URL: http://blog.internot.info/2014/06/securing-ubuntu-desktop-from-bad-guys.html
