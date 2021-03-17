FROM httpd:latest

#RUN mkdir . /var/www/html

COPY ./index.html /usr/local/apache2/htdocs



