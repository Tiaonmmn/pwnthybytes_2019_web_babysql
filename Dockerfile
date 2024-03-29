FROM ctftraining/base_image_nginx_mysql_php_73
COPY files/ /var/www/html/
RUN sh -c "mysqld_safe &" &&\
    mv /var/www/html/src/* /var/www/html/ &&\
    mv /var/www/html/flag / &&\
    chown -R www-data:www-data /var/www/html &&\
    chmod 755 /var/www/html/templates &&\
    rm -rfv /var/www/html/src &&\
    sleep 3 &&\
    mysql -e "source /var/www/html/db.sql;" -uroot -proot &&\
    rm -rfv /var/www/html/db.sql
    
