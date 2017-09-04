#
PHPDIR=/etc/php/5.6/
PHPMODDIR=/usr/lib/php/20131226/
# PHPDIR=/etc/php/7.0/
# PHPMODDIR=/usr/lib/php/20151012/
# PHPDIR=/etc/php/7.1/
# PHPMODDIR=/usr/lib/php/20160303/

# подключаем модуль к PHP 
cp ./modules/sweph.so $PHPMODDIR
echo ">>> Extentions file has been copied to modules directory\n"
touch $PHPDIR/mods-available/sweph.ini
cat >$PHPDIR/mods-available/sweph.ini <<EOF
extension=sweph.so
EOF
ln -s $PHPDIR/mods-available/sweph.ini $PHPDIR/fpm/conf.d/20-sweph.ini
ln -s $PHPDIR/mods-available/sweph.ini $PHPDIR/cli/conf.d/20-sweph.ini
echo ">>> Ini files has been created for PHP\n"
service php5.6-fpm restart
echo ">>> PHP-fpm service has been restarted\n"

