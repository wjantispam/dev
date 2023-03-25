I was in a public library where I noticed running `git pull` has timedout.
I run `ssh -T git@github.com` and it confirms the libary firewall is prohibted
the ssh connection.
 This was fixed with the following

    sudo nano ~/.ssh/config

    Host github.com
     Hostname ssh.github.com
     Port 443

