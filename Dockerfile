# znc
#
# VERSION               0.1.0
# DOCKER-VERSION        0.7.0

FROM       stackbrew/debian
MAINTAINER Sven Dowideit "SvenDowideit@home.org.au"

# make sure the package repository is up to date
RUN 	apt-get update

RUN 	apt-get install -y znc znc-dbg znc-dev znc-extra znc-perl znc-python znc-tcl && apt-get clean

RUN 	useradd znc
ADD 	. /src
RUN 	cd /src && chmod +x run-znc && cp run-znc /usr/local/bin/

RUN	mkdir /znc-data
RUN 	chown znc:znc /znc-data
RUN 	chmod 777 /znc-data
RUN	echo workround > /znc-data/.workaround

USER 	znc
EXPOSE 	6660
VOLUME	["/znc-data"]
CMD 	run-znc
