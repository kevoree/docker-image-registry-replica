#! /bin/sh
# retrieve official Kevoree registry content
curl http://registry.kevoree.org/\* --header "Accept: application/json" > /tmp/kevoree-registry.json

# create log directory
mkdir /var/log/kevoree

# start Kevoree registry server locally
java -jar /opt/kevoree/kevoree-registry.jar > /var/log/kevoree/registry.log &

# wait for server to start
sleep 3

# push official Kevoree registry model to local registry
curl -X POST -d @/tmp/kevoree-registry.json http://localhost:8080/deploy --header "Content-Type:application/json"

# output log
tail -f -n 100 /var/log/kevoree/registry.log
