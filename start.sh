#! /bin/sh
# retrieve official Kevoree registry content

# if CURL_REGISTRY is defined at "false" the replication is skiped

if [ "false" != "$CURL_REGISTRY" ]
then
  curl http://registry.kevoree.org/\* --header "Accept: application/json" > /tmp/kevoree-registry.json
fi

# create log directory
mkdir /var/log/kevoree

# start Kevoree registry server locally
java -jar /opt/kevoree/kevoree-registry.jar > /var/log/kevoree/registry.log &

# wait for server to start
sleep 3

# push official Kevoree registry model to local registry
if [ "false" != "$CURL_REGISTRY" ]
then
  curl -X POST -d @/tmp/kevoree-registry.json http://localhost:8080/deploy --header "Content-Type:application/json"
fi

# output log
tail -f -n 100 /var/log/kevoree/registry.log
