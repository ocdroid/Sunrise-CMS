![Sunrise CMS Logo](git-res/logo.png)

# Sunrise CMS

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Build Status](https://travis-ci.com/Nickbur/Sunrise_CMS_Project.svg?branch=master)](https://travis-ci.com/Nickbur/Sunrise_CMS_Project)

Another e-commerce solution

> **Warning!**
> This is **not a release** or even a test build. The project is **in development** and sooner or later it will be ready.

![Sunrise CMS Demo screenshot](git-res/screenshot-demo.png)

## Demo
* [Frontend](https://sunrise-cms.freelance-team.su/)   
* [Backend](https://sunrise-cms.freelance-team.su/admin/) (login: ```admin```, password: ```dev```)

## Support and discussion
* [Issues](https://github.com/Nickbur/Sunrise_CMS_Project/issues)  
* [Official forum](https://freelance-team.su/forum/2-sunrise-cms/)

## Install
1. Move ```/dist/``` contents to your webroot
2. Edit ```$domain``` value in ```catalog/config/domain.php``` and ```admin/config/domain.php```
3. Edit your database settings in ```catalog/config/db.php``` and ```admin/config/db.php```
4. Import ```cms.sql```

## Requirements
* Apache Web Server *(v2.4 recommended)*  
* PHP 7.2+ *(v7.3 recommended)*  
* MySQL 5.6+ *(v8.0 recommended)*  
* Fast file storage or Redis *(Redis recommended)*

## .htaccess
```
RewriteEngine On  
RewriteBase /  
RewriteRule ^system/storage/(.*) index.php?route=error/not_found [L]  
RewriteCond %{REQUEST_FILENAME} !-f  
RewriteCond %{REQUEST_FILENAME} !-d  
RewriteCond %{REQUEST_URI} !.*\.(ico|gif|jpg|jpeg|png|js|css)  
RewriteRule ^([^?]*) index.php?_route_=$1 [L,QSA]
```

## Author

* *Current main developer:* Mykola Burakov burakov.work@gmail.com

## License
[GNU General Public License v3.0](https://github.com/Nickbur/Sunrise_CMS_Project/blob/master/LICENSE)
