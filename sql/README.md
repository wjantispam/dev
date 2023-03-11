## Install MariaDB on Debian 11 (WSL)

```
sudo apt install mariadb-server mariadb-client
```
then you can test it via

```
mariadb --version
```

and login via (see later on how to login as user)

`sudo mariadb`

it is good idea to run the follwing:
`sudo mysql_secure_installation`


## Start or Stop

WSL current do not use systemd, so there are two ways to
1. Via init.d
```
sudo /etc/init.d/mariadb start
```

or 
```
sudo service mariadb start
```

## Set up local user

```
$> sudo mariadb

sql) CREATE USER jianwei@localhost IDENTIFIED BY '111';
sql) GRANT ALL ON *.* TO jianwei@localhost WITH GRANT OPTION;
sql) FLUSH PRIVILEGES;

$> mariadb -u jianwei -p111
```




## Remove MariaDB

sudo apt-get  --purge remove "mysql*"

### you may also want to remove the following

1. Configuration
/etc/mysql/

2. Data folder
/var/lib/mysql

3. Log
/var/log/mysql


