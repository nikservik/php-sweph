# UBUNTU 16.04
# PHP 5.6, 7.0, 7.1

# Скачать скрипт и php-sweph
# git clone https://github.com/nikservik/php-sweph
# В скрипте compile.sh выбрать версию php


SWEURL=http://www.astro.com/ftp/swisseph/swe_unix_src_2.06.tar.gz
PHPDIR=/etc/php/5.6/
PHPMODDIR=/usr/lib/php/20131226/
# PHPDIR=/etc/php/7.0/
# PHPMODDIR=/usr/lib/php/20151012/
# PHPDIR=/etc/php/7.1/
# PHPMODDIR=/usr/lib/php/20160303/


# компилируем библиотеку SWEPH 
wget $SWEURL
tar -xzvf $(basename $SWEURL)
cd src
make
cd ..
cp ./src/libswe.a ./
cp ./src/sweodef.h ./
cp ./src/swephexp.h ./

# компилируем модуль для PHP7 
phpize
./configure  --enable-sweph
make

# подключаем модуль к PHP 
cp ./modules/sweph.so $PHPMODDIR
touch $PHPDIR/mods-available/sweph.ini
cat >$PHPDIR/mods-available/sweph.ini <<EOF
extension=sweph.so
EOF
ln -s $PHPDIR/mods-available/sweph.ini $PHPDIR/fpm/conf.d/20-sweph.ini
ln -s $PHPDIR/mods-available/sweph.ini $PHPDIR/cli/conf.d/20-sweph.ini
