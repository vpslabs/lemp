# LEMP Installer
The Linux-Nginx-MariaDB-PHP (LEMP) installer for local computer and VPS for Ubuntu / Debian derivative.

This will remove installed PHP, NginX and MariaDB then install the LEMP stack from ppa:ondrej/php

## Installation

```
sudo apt-get install ca-certificates
wget https://raw.githubusercontent.com/mikekatip/lemp-server-install/master/lemp-server-install.sh
chmod +x lemp-server-install.sh
./lemp-server-install.sh
rm lemp-server-install.sh
```
## Domain Management Script

### Add a Domain

#### Public Web Server

```
sudo /usr/bin/domain add domain.tld
```

- Web Root Directory: `/var/www/domain.tld`
- nginx .conf file: `/etc/nginx/conf.d/domain.tld.conf`
- Configured for SSL using LetsEncrypt
- `http://domain.tld` will be redirected to `https://domain.tld`
- `http://www.domain.tld` will be redirected to `https://domain.tld`
- `https://www.domain.tld` will be redirected to `https://domain.tld`

#### Local Web Server

```
sudo domain add domain.local
```

If you installed LEMP on your local development machine instead of a public web sever, replace `.tld` (.com, .net, .org, etc) with `.local`. 

- Web Root Directory: `/var/www/domain.local`
- nginx .conf file: `/etc/nginx/conf.d/domain.local.conf`
- `/etc/hosts` will be updated to point `domain.local` to `127.0.0.1`
- Not configured for SSL

### Remove a Domain

Make sure to make a backup before removing a domain.

```
sudo domain remove domain.tld
```
```
sudo domain remove domain.local
```

- Removes Web Root Directory (will not be backed up before deletion)
- Removes nginx .conf file (will not be backed up before deletion)
- Restarts nginx
