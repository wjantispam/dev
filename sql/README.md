



# Basic Install MariaDB


### Debian 11 (WSL)

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

### MacOS
brew install mariadb


## Start or Stop
### WSL
WSL current do not use systemd, so there are two ways to
1. Via init.d
```
sudo /etc/init.d/mariadb start
```

or 
```
sudo service mariadb start
```
### MacOS
brew services start mariadb

## Set up local user

```
$> sudo mariadb

sql) CREATE USER jianwei@localhost IDENTIFIED BY '111';
sql) GRANT ALL ON *.* TO jianwei@localhost WITH GRANT OPTION;
sql) FLUSH PRIVILEGES;

$> mariadb -u jianwei -p111
```

### MacOS
After MariaDB Server is started, you can log in as your user:

mysql

Or log in as root:

sudo mysql -u root


## Remove MariaDB

sudo apt-get  --purge remove "mysql*"

### you may also want to remove the following

1. Configuration
/etc/mysql/

2. Data folder
/var/lib/mysql

3. Log
/var/log/mysql


# Advanced Installation on MacOS
Here we would like to use the user config

Let's see what we have with brew
`brew info mariadb`

`brew install mariadb`

Once installed there are two ways to start the database by default
`brew services start mariadb`
or
`/usr/local/opt/mariadb/bin/mysqld_safe --datadir=/usr/local/var/mysql`

the first option that generates the `/Users/dean/Library/LaunchAgents/homebrew.mxcl.mariadb.plist` file that can be started when after reboot, and the 2nd approach can pass in arguments for more advanced control.

Note, this also created a new database in the `/usr/local/var/` directory.

## my.conf
A few folders needs to be created
```
mkdir -p ~/sw/etc/mysql
mkdir -p ~/logs/mysql
mkdir -p ~/data/mysql
# You will also need to move the current mysql dir
cp /usr/local/var/mysql ~/data/
mv /usr/local/var/mysql /usr/local/var/mysql.bak
```
Here is the basic config
```
❯ cat ~/sw/etc/mysql/my.cnf
[mariadbd]
datadir = /Users/dean/data/mysql
general_log_file = /Users/dean/logs/mysql/general.log
log_error = /Users/dean/logs/mysql/error.log
slow_query_log_file = /Users/dean/logs/mysql/slow.log
```
You can test it with the option 2,
`/usr/local/opt/mariadb/bin/mysqld_safe --defaults-file=/Users/dean/sw/etc/mysql/my.cnf`

## Config brew to starts mariadb with customized config
We want to make option 1 to work

`brew servies start mariadb`  will creates a `plist` file, and the file is in `/usr/local/Cellar/mariadb/10.11.2/homebrew.mxcl.mariadb.plist` , so we will have to modify it so that the new config file can be picked up

```
❯ diff /usr/local/Cellar/mariadb/10.11.2/homebrew.mxcl.mariadb.plist /Users/dean/sw/etc/mysql/mariadb.plist
20c20
< 		<string>--datadir=/usr/local/var/mysql</string>
---
> 		<string>--default-file=/Users/dean/sw/etc/mysql/my.cnf</string>
```

make a backup and copy the config over.

I also noticed I will need to make a symlink here so it picks up the correct my.cnf
```
/usr/local/etc/my.cnf.d
❯ ll
total 0
lrwxr-xr-x@ 1 dean  admin    31B 17 Apr 22:26 my.cnf@ -> /Users/dean/sw/etc/mysql/my.cnf

```

## Verify
if above works you can then login with `mysql`  (yes that's all you need to type)


# Issues with MacOS
❯ brew services start mariadb
Bootstrap failed: 5: Input/output error
Try re-running the command as root for richer errors.
Error: Failure while executing; `/bin/launchctl bootstrap gui/501 /Users/dean/Library/LaunchAgents/homebrew.mxcl.mariadb.plist` exited with 5.







❯ sudo brew services start mariadb
Warning: Taking root:admin ownership of some mariadb paths:
  /usr/local/Cellar/mariadb/10.11.2/bin
  /usr/local/Cellar/mariadb/10.11.2/bin/mariadbd-safe
  /usr/local/opt/mariadb
  /usr/local/opt/mariadb/bin
  /usr/local/var/homebrew/linked/mariadb
This will require manual removal of these paths using `sudo rm` on
brew upgrade/reinstall/uninstall.
Warning: mariadb must be run as non-root to start at user login!
==> Successfully started `mariadb` (label: homebrew.mxcl.mariadb)
