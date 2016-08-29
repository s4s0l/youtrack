FROM openjdk:jdk-alpine

RUN apk add --no-cache su-exec \
     && apk add --update curl \
     && apk add --update bash \
     && rm -rf /var/cache/apk/*
ENV YOUTRACK_URL=https://download.jetbrains.com/charisma/youtrack-6.5.17105.jar
ENV HOME=/youtrack
ENV YOUTRACK_HOME=/youtrack
RUN \
        mkdir -p /youtrack/home/.youtrack && \
        mkdir -p /youtrack/db && \
        addgroup -g 1000 youtrack && \
        adduser -S -h /youtrack/home -u 1000 -G youtrack youtrack && \
        chown -R youtrack:youtrack /youtrack

RUN curl -L $YOUTRACK_URL -o /youtrack/youtrack.jar

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
VOLUME ["/youtrack/home/.youtrack", "/youtrack/db"]
EXPOSE 8080
CMD ["youtrack", "java" , "-Xmx1g", "-XX:MaxPermSize=250m", "-Ddatabase.location=/youtrack/db", "-Djava.awt.headless=true", "-Djetbrains.youtrack.disableBrowser=true", "-jar", "/youtrack/youtrack.jar", "8080"]
