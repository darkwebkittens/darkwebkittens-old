# To deploy this container directly from Docker Hub, use:
#
#        docker run --cap-drop=all --name cccp -d ajhaydock/cccptor
#
# To build and run this container locally, try a command like:
#
#        docker build -t cccptor .
#        docker run --cap-drop=all --name cccp -d cccptor
#

FROM ajhaydock/nginx
MAINTAINER Alex Haydock <alex@alexhaydock.co.uk>

# Build container as root
USER root

# Make workdir
RUN mkdir -p /opt/onion
WORKDIR /opt/onion

# Install Tor
RUN dnf install -y \
      tor && \
    dnf clean all

# Add my sample nginx config and Tor config, and script to start nginx and Tor together
ADD nginx.conf /etc/nginx/nginx.conf
ADD torrc /etc/tor/torrc
ADD startonion.sh /opt/onion/startonion

# Set perms on nginx dirs
RUN chown -R nginx:nginx /usr/share/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx && \
    chown -R nginx:nginx /var/lib/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Set perms on Tor dirs
RUN chown -R nginx:nginx /etc/tor && \
    chown -R nginx:nginx /var/lib/tor

# Set perms on workdir
RUN chown -R nginx:nginx /opt/onion && \
    chmod +x /opt/onion/startonion

# Launch Tor + nginx in container as the Tor user (makes things easier)
USER nginx

# Launch command
CMD ["/opt/onion/startonion"]
