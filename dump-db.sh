#!/usr/bin/env bash
echo "DELETE FROM watchdog; DELETE FROM cache; DELETE FROM cache_block; DELETE FROM cache_filter; DELETE FROM cache_form; DELETE FROM cache_menu; DELETE FROM cache_page; DELETE FROM oauth_common_nonce; DELETE FROM oauth_common_token;" |mysql -uroot -p iphone_drupal
mysqldump --opt -uroot -p iphone_drupal > dbdump.sql
