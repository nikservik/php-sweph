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
echo "\n>>> Swiss Ephemeris library has been downloaded\n"
cd src
make
echo "\n>>> Swiss Ephemeris library has been compiled\n"
cd ..
cp ./src/libswe.a $LIBPATH
cp ./src/sweodef.h $INCLUDEPATH
cp ./src/swephexp.h $INCLUDEPATH
echo "\n>>> Swiss Ephemeris library files has been placed to default paths\n"

# компилируем модуль для PHP7 
phpize
echo "\n>>> sweph-php extention has been phpized\n"
./configure  --enable-sweph
echo "\n>>> sweph-php extention has been configured\n"
make
echo "\n>>> sweph-php extention has been successfully created\nPlease run sudo ./install.sh\n"

