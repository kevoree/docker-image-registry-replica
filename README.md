## registry-replica

### Get image
```sh
docker pull kevoree/registry-replica
```
### Usage
```sh
docker run -it -p 8080:8080 kevoree/registry-replica
```

### How does it work ?
This image is based on `dockerfile/java:oracle-java8` and contains a compiled Jar-file of `kevoree-registry@5.0.0`  
When started, a `cURL` command retrieves the current content of the official [Kevoree registry](http://registry.kevoree.org), 
stored it in `/tmp/kevoree-registry.json` and start an instance of the registry locally using `/opt/kevoree/kevoree-registry.jar`.  
Once started (sleep 3), another `cURL` command is thrown to push `/tmp/kevoree-registry.json` to the local registry, making it a "replica"
