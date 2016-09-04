FROM debian
MAINTAINER Preston Thornburg <ptonewreckin>

# Run demonsaw in a contianer

# docker run \
#	-e DISPLAY=[YourIP]:0 demonsaw
#   socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

RUN apt-get update && apt-get install -y \
	libxcb-glx0 \
	libX11-xcb1 \
	libX11-xcb-dev \ 
	libxi6 libfontconfig1 \ 
	libXrender1 \
	libglib2.0-0 \
	libgl1-mesa-dev \
	curl \
    --no-install-recommends 

RUN curl -k "https://www.demonsaw.com/download/3.0.5/demonsaw_debian_64.tar.gz" -o /tmp/demonsaw.tar.gz \ 
	&& gunzip /tmp/demonsaw.tar.gz \
	&& tar -xvf /tmp/demonsaw.tar

ENV QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb
CMD ["./demonsaw"]


