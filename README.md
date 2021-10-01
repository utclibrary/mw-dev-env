# mw-dev-env
UTC Library MediaWiki Development Environment

Install:
1. Install VirtualBox https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant https://www.vagrantup.com/
3. Install Git https://git-scm.com/ (we will use git bash - use CTRL+SHIFT+INS to paste OR right-click)
4. Create mw-upgrade folder in home directory and copy down /var/www/html files to this folder from target t/plibmw server
5. Clone this repo (git clone https://github.com/utclibrary/mw-dev-env )
6. cd mw-dev-env
7. Copy t/pmysql mw backup database from synology and name wiki_lib.sql in this folder
8. vagrant plugin install vagrant-vbguest
9. vagrant up
10. go to http://192.168.33.21 (bypass security warning)

Notes:
-  ~/mw-upgrade/ is root for html
- Consult Google Docs (Information Technology > Library IT - Systems > Library IT - Servers > Mediawiki)
- To stop: vagrant halt
- To restart: vagrant up > vagrant provision
- You may also vagrant destroy to completely rebuild the server
