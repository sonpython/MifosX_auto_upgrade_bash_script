# MifosX_auto_upgrade_bash_script
Bash script auto upgrade Mifosx follow this instruction https://github.com/openMF/mifosx/wiki/Installation-FAQ's#upgrading-an-existing-installation-of-mifosx

# How to use

- Copy the upgrademifosx.sh to your server
- Run with root (`sudo su`)
- Then run the bash script `sh upgrademifosx.sh "version"`

example: `sh upgrademifosx.sh "16.01.1"`

or want it simpler? just copy and run the command bellow

`apt-get install wget -y;wget https://raw.githubusercontent.com/sonpython/MifosX_auto_upgrade_bash_script/master/upgrademifosx.sh; sh upgrademifosx.sh "16.01.1"`

# What does it do

$1 = the version param you input when run the 

- stop the tomcat7 server
- Download MifosX release $1
- unzip new release $1
- go to the new relead $1 folder
- remove old mifosng-provider
- copy new mifosng-provider $1
- remove old MifosX web app
- copy new MifosX web app and api live page $1
- restart the tomcat7 server
- Now will tail the log to see what happen
