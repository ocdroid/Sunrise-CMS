<?php

$http_text =  "User-agent: *
Disallow: /*route=account
Disallow: /*route=checkout
Disallow: /*route=product/search
Disallow: /download
Disallow: /forgot-password
Disallow: /my-account
Disallow: /system
Disallow: /newsletter
Disallow: /order-history
Disallow: /reward-points
Disallow: /adress-book
Disallow: /transactions
Disallow: /*?sort=
Disallow: /*&sort=
Disallow: /*?order=
Disallow: /*&order=
Disallow: /*?filter_name=
Disallow: /*&filter_name=
Disallow: /*?filter_sub_category=
Disallow: /*&filter_sub_category=
Disallow: /*?filter_description=
Disallow: /*&filter_description=
Disallow: /*?tracking=
Disallow: /*&tracking=
Disallow: /search
Disallow: /*tag=
Disallow: /*?tag=
Disallow: /*&tag=
Disallow: /simplecheckout/
Disallow: /*simplecheckout
Disallow: /*?simplecheckout
Disallow: /*&simplecheckout
Disallow: /*record/search
Disallow: /*?record/search
Disallow: /*&record/search
Disallow: /*search
Disallow: /*?filter=
Disallow: /*&filter=
Disallow: /login
#Disallow: /index.php?route=product/manufacturer
Disallow: /specials
Disallow: /*&amp
Sitemap: http://site.com/index.php?route=feed/sitemap_pro
Sitemap: http://site.com/index.php?route=feed/blog_sitemap
Sitemap: http://site.com/index.php?route=feed/ocfilter_sitemap

User-agent: Yandex
Disallow: /*route=account
Disallow: /*route=checkout
Disallow: /*route=product/search
Disallow: /download
Disallow: /forgot-password
Disallow: /my-account
Disallow: /system
Disallow: /newsletter
Disallow: /order-history
Disallow: /reward-points
Disallow: /adress-book
Disallow: /transactions
Disallow: /*?sort=
Disallow: /*&sort=
Disallow: /*?order=
Disallow: /*&order=
Disallow: /*?filter_name=
Disallow: /*&filter_name=
Disallow: /*?filter_sub_category=
Disallow: /*&filter_sub_category=
Disallow: /*?filter_description=
Disallow: /*&filter_description=
Disallow: /*?tracking=
Disallow: /*&tracking=
Disallow: /search
Disallow: /*tag=
Disallow: /*?tag=
Disallow: /*&tag=
Disallow: /simplecheckout/
Disallow: /*simplecheckout
Disallow: /*?simplecheckout
Disallow: /*&simplecheckout
Disallow: /*record/search
Disallow: /*?record/search
Disallow: /*&record/search
Disallow: /*search
Disallow: /*?filter=
Disallow: /*&filter=
Disallow: /login
#Disallow: /index.php?route=product/manufacturer
Disallow: /specials
Disallow: /*&amp
Sitemap: http://site.com/index.php?route=feed/sitemap_pro
Sitemap: http://site.com/index.php?route=feed/blog_sitemap_yandex
Sitemap: http://site.com/index.php?route=feed/ocfilter_sitemap
";

$https_text =  "User-agent: *
Disallow: /*route=account
Disallow: /*route=checkout
Disallow: /*route=product/search
Disallow: /download
Disallow: /forgot-password
Disallow: /my-account
Disallow: /system
Disallow: /newsletter
Disallow: /order-history
Disallow: /reward-points
Disallow: /adress-book
Disallow: /transactions
Disallow: /*?sort=
Disallow: /*&sort=
Disallow: /*?order=
Disallow: /*&order=
Disallow: /*?filter_name=
Disallow: /*&filter_name=
Disallow: /*?filter_sub_category=
Disallow: /*&filter_sub_category=
Disallow: /*?filter_description=
Disallow: /*&filter_description=
Disallow: /*?tracking=
Disallow: /*&tracking=
Disallow: /search
Disallow: /*tag=
Disallow: /*?tag=
Disallow: /*&tag=
Disallow: /simplecheckout/
Disallow: /*simplecheckout
Disallow: /*?simplecheckout
Disallow: /*&simplecheckout
Disallow: /*record/search
Disallow: /*?record/search
Disallow: /*&record/search
Disallow: /*search
Disallow: /*?filter=
Disallow: /*&filter=
Disallow: /login
#Disallow: /index.php?route=product/manufacturer
Disallow: /specials
Disallow: /*&amp
Sitemap: https://site.com/index.php?route=feed/sitemap_pro
Sitemap: https://site.com/index.php?route=feed/blog_sitemap
Sitemap: https://site.com/index.php?route=feed/ocfilter_sitemap

User-agent: Yandex
Disallow: /*route=account
Disallow: /*route=checkout
Disallow: /*route=product/search
Disallow: /download
Disallow: /forgot-password
Disallow: /my-account
Disallow: /system
Disallow: /newsletter
Disallow: /order-history
Disallow: /reward-points
Disallow: /adress-book
Disallow: /transactions
Disallow: /*?sort=
Disallow: /*&sort=
Disallow: /*?order=
Disallow: /*&order=
Disallow: /*?filter_name=
Disallow: /*&filter_name=
Disallow: /*?filter_sub_category=
Disallow: /*&filter_sub_category=
Disallow: /*?filter_description=
Disallow: /*&filter_description=
Disallow: /*?tracking=
Disallow: /*&tracking=
Disallow: /search
Disallow: /*tag=
Disallow: /*?tag=
Disallow: /*&tag=
Disallow: /simplecheckout/
Disallow: /*simplecheckout
Disallow: /*?simplecheckout
Disallow: /*&simplecheckout
Disallow: /*record/search
Disallow: /*?record/search
Disallow: /*&record/search
Disallow: /*search
Disallow: /*?filter=
Disallow: /*&filter=
Disallow: /login
#Disallow: /index.php?route=product/manufacturer
Disallow: /specials
Disallow: /*&amp
Sitemap: https://site.com/index.php?route=feed/sitemap_pro
Sitemap: https://site.com/index.php?route=feed/blog_sitemap_yandex
Sitemap: https://site.com/index.php?route=feed/ocfilter_sitemap
";

function check_https() {
	if ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') || $_SERVER['SERVER_PORT'] == 443) {
		return true; 
	}
	return false;
}

if (check_https()) {
	// if HTTPS/SSL enabled
	header("Content-Type: text/plain");
	echo $https_text;
} else {
	// if not
	header("Content-Type: text/plain");
	echo $http_text;
}

exit;
