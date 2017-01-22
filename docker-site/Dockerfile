# To deploy this container directly from Docker Hub, use:
#
#        docker run --cap-drop=all --name cccp -d -p 80:8080 ajhaydock/cccp
#
# To build and run this container locally, try a command like:
#
#        docker build -t cccp .
#        docker run --cap-drop=all --name cccp -d -p 80:8080 cccp
#

FROM fedora:latest
MAINTAINER Alex Haydock <alex@alexhaydock.co.uk>

ENV SITETODEPLOY https://github.com/ajhaydock/CreativeCommonsCatPictures

# Update container, and install nginx & git
RUN dnf -y install nginx git php-fpm \
  && dnf clean all

# Add our script to start php-fpm and nginx together
ADD kittens.sh /kittens

# Add my custom nginx config
ADD nginx.conf /etc/nginx/nginx.conf

# Deploy site into HTML dir
RUN rm -rf "/usr/share/nginx/html/" \
        && git clone $SITETODEPLOY /usr/share/nginx/html

# Make sure the permissions are set correctly on our nginx and php-fpm
# config dirs, pidfiles and Unix sockets so that we can run as non-root.
RUN chown -R nginx:nginx /usr/share/nginx \
  && chmod -R 555 /usr/share/nginx \
  && touch /var/run/nginx.pid \
  && chown -R nginx:nginx /var/run/nginx.pid \
  && chown -R nginx:nginx /etc/nginx \
  && chown -R nginx:nginx /var/log/php-fpm \
  && chown -R nginx:nginx /run/php-fpm \
  && chown nginx:nginx /kittens \
  && chmod +x /kittens

# Command to launch when container is started
USER nginx
##CMD ["bash"]
CMD ["./kittens"]
