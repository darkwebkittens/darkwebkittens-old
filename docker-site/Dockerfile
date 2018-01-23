# To deploy this container directly from Docker Hub, use:
#
#        docker run --cap-drop=all --name cccp -p 80:8080 -d ajhaydock/cccp
#
# To build and run this container locally, try a command like:
#
#        docker build -t cccp .
#        docker run --cap-drop=all --name cccp -p 80:8080 -d cccp
#

FROM fedora
MAINTAINER Alex Haydock <alex@alexhaydock.co.uk>

ENV SITETODEPLOY https://github.com/ajhaydock/CreativeCommonsCatPictures

# Build container as root
USER root
WORKDIR /root

# Install php-fpm
RUN dnf install -y nginx php-fpm git && dnf clean all

# Clone site from Git into HTML dir
RUN git clone $SITETODEPLOY /usr/share/nginx/html/kittens

# Add my custom nginx config, and the script to generate
# a list of Tor exits then start php-fpm and nginx together.
ADD nginx.conf /etc/nginx/nginx.conf
ADD kittens.sh /usr/share/nginx/kittens

# nginx permissions
RUN touch /run/nginx.pid && chown -R nginx:nginx /run/nginx.pid
RUN chown -R nginx:nginx /usr/share/nginx && chmod -R 555 /usr/share/nginx
RUN chown -R nginx:nginx /etc/nginx

# PHP permissions
RUN chown -R nginx:nginx /var/log/php-fpm
RUN chown -R nginx:nginx /run/php-fpm

# Script permissions
RUN chmod +x /usr/share/nginx/kittens

# Launch Nginx in container as non-root
USER nginx
WORKDIR /usr/share/nginx

# Launch command
CMD ["/usr/share/nginx/kittens"]
