# We need to use Alpine's "edge" branch since it seems to be
# the only one that currently provides Tor via APK.

FROM alpine:edge
MAINTAINER Alex Haydock <alex@alexhaydock.co.uk>

ENV HOME /var/lib/tor

ENV HIDDENSVCIP 172.16.16.80
ENV HIDDENSVCPT 80

RUN apk --no-cache add \
	tor

# Copy in our torrc file
ADD torrc /etc/tor/torrc

# Add the final line to our torrc, telling Tor which IP and port our hidden service is at
RUN echo "HiddenServicePort 80 $HIDDENSVCIP:$HIDDENSVCPT"

# Set correct permissions
RUN chown -R tor /etc/tor
RUN chown -R tor /var/lib/tor
RUN chmod -R 700 /var/lib/tor

USER tor
CMD [ "tor" ]
