# Sunrise CMS
Another e-commerce solution

## Demo
Frontend https://sunrise-cms.freelance-team.su/  
Backend https://sunrise-cms.freelance-team.su/admin/ (admin/dev)

## Install
1. Move /dev/ contents to your webroot
2. Edit $real_url and DB settings in config.php and admin/config.php
3. Import cms.sql

## Requirements
Apache 2.4+  
PHP 7.2+  
MySQL 5.6+  
Redis

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
