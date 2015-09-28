FROM        java:8
MAINTAINER  Maxime Tricoire <max.tricoire@gmail.com> (@maxleiko)

EXPOSE 8080

ADD         kevoree-registry.jar /opt/kevoree/kevoree-registry.jar
ADD         start.sh    /root/start.sh

ENTRYPOINT  ["sh", "/root/start.sh"]
