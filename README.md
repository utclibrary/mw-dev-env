# mw-dev-env
UTC Library MediaWiki Development Environment

Install:
1. Install VirtualBox https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant https://www.vagrantup.com/
3. Install Git https://git-scm.com/ (we will use git bash - use CTRL+SHIFT+INS to paste OR right-click)
4. Clone this repo (git clone https://github.com/utclibrary/mw-dev-env )
5. cd mw-dev-env
6. vagrant plugin install vagrant-vbguest
7. vagrant up
8. go to 192.168.33.15 OR localhost:8080 (in web browser)

Notes:
-  ~/mw-dev/ is root for html
- To stop: vagrant halt
- To restart: vagrant up > vagrant provision
- You may also vagrant destroy to completely rebuild the server
