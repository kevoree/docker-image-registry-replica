FROM        dockerfile/java:oracle-java8
MAINTAINER  Maxime Tricoire <max.tricoire@gmail.com> (@maxleiko)

ADD         kevoree-registry.jar /opt/kevoree/kevoree-registry.jar
ADD         start.sh    /root/start.sh

ENTRYPOINT  ["sh", "/root/start.sh"]
#ENTRYPOINT  ["java", "-jar", "/opt/kevoree/kevoree-registry.jar"]
