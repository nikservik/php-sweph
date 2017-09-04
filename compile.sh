# UBUNTU 16.04
# PHP 5.6, 7.0, 7.1

# Скачать скрипт и php-sweph
# git clone -b php5.6 https://github.com/nikservik/php-sweph.git
# В скрипте compile.sh выбрать версию php


SWEURL=http://www.astro.com/ftp/swisseph/swe_unix_src_2.06.tar.gz
LIBPATH=/usr/local/lib
INCLUDEPATH=/usr/local/include


# компилируем библиотеку SWEPH 
wget $SWEURL
tar -xzvf $(basename $SWEURL)
cd src
make
cd ..
cp ./src/libswe.a $LIBPATH
cp ./src/sweodef.h $INCLUDEPATH
cp ./src/swephexp.h $INCLUDEPATH

# компилируем модуль для PHP7 
phpize
./configure  --enable-sweph
make

