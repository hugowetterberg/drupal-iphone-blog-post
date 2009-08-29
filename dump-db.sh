#!/usr/bin/env bash
echo "DELETE FROM di_watchdog; DELETE FROM di_cache; DELETE FROM di_cache_block; DELETE FROM di_cache_filter; DELETE FROM di_cache_form; DELETE FROM di_cache_menu; DELETE FROM di_cache_page; DELETE FROM di_oauth_common_nonce; DELETE FROM di_oauth_common_token;" |mysql -uroot -p drupaliphone
mysqldump --opt -uroot -p drupaliphone > dbdump.sql
