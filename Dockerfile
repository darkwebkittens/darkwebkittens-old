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
RUN dnf -y upgrade \
  && dnf -y install nginx git php-fpm \
  && dnf clean all

# Add my custom nginx config
ADD nginx.conf /etc/nginx/nginx.conf

# Deploy site into HTML dir
RUN rm -rf "/usr/share/nginx/html/" \
        && git clone $SITETODEPLOY /usr/share/nginx/html

# Add our script to start php-fpm and nginx together
ADD kittens.sh /kittens

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

# Forward request and error logs to Docker log collector
# (We can do this with access logs too, but I don't intend to expose
# this container directly to the internet and will frontrun it with
# a seperate SSL terminator instead, running a custom nginx build)
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Command to launch when container is started
USER nginx
##CMD ["bash"]
CMD ["kittens"]
