##########################################################
###  SHELL SCRIPT TO CONFIGURE MY SQL DATABASE SERVER  ###
##########################################################
## v1 - Lyncon Pio                                      ##
##########################################################

mv /home/userazure/configFiles/.profile /home/userazure

sudo apt update
sudo apt install -y mysql-server-5.7
sudo cp -f /home/userazure/configFiles/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo mysql < /home/userazure/configFiles/scriptdb.sql
sudo systemctl restart mysql.service
sleep 30