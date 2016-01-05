FROM mhart/alpine-node:latest
MAINTAINER subzero79

ADD src/ /root/

ENV export TERM=xterm

RUN apk add --update unzip wget supervisor nano 

RUN mv /root/supervisord.conf /etc/supervisord.conf && \
	mkdir /app /config && \
	wget --no-check-certificate https://github.com/onedr0p/telegram-sonarr-bot/archive/master.zip -P /app && \
	unzip /app/master.zip -d /app && \
	rm /app/master.zip

RUN cd /app/telegram-sonarr-bot-master && npm install && \
	ln -s /config/config.json /app/telegram-sonarr-bot-master/config.json && \
	cp /app/telegram-sonarr-bot-master/acl.json.template /config/acl.json && chown nobody:nobody /config/acl.json && \
	ln -s /config/acl.json /app/telegram-sonarr-bot-master/acl.json && \
    chmod 777 -R . && chown nobody:nobody -R . 

 

RUN apk del unzip wget

VOLUME /config

CMD ["supervisord","-c","/etc/supervisord.conf"]
