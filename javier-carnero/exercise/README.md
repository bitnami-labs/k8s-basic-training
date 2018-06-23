# Kubernetes Bitnami Intro Training Exercise

Work to be done.

## Excercise original description:

### WP + MariaDB

Create the K8s resources you need to deploy a WP site on your cluster using MariaDB as database with the characteristics below:

* All the resources should be created under the *exercise* namespace.
* The WP site should use a MariaDB database.
* Use ConfigMaps and Secrets to configure both MariaDB and WP.
  * Admin user for WP should be "kubernetes" with password "training"
  * MariaDB password should NOT be empty
* WP should be accessible through http using a NGINX Ingress on the URL *wordpress.exercise.com*.

Bonus:

* Add appropriate readiness/liveness probes to MariaDB and WP containers.
* WP should be accessible through http/https using a NGINX Ingress on the URL *wordpress.exercise.com* . Ingress should handle the TLS certificates.

### What to deliver

* YAML/JSON files with the definitions of every requested K8s object. Templates are provided.
* If you created your resources from the command line, attach a bash script with the commands used to create them. Sth like:

```
#!/bin/bash

kubectl create secret generic ...
```

Use the structure below on your PR To GitHub (https://github.com/bitnami-labs/k8s-intro-training):

```
|
|-/<your-name>
|-/<your-name>/exercise/
|-/<your-name>/exercise/README.md
|-/<your-name>/exercise/commands.bash
|-/<your-name>/exercise/*.yaml
```

### Tips

* Use a linter to avoid syntax errors on your YAML/JSON files
* You can user the Docker Image below to run a linter

```
docker run -v /path-to-your-defs:/opt/data-definitions \
juanariza131/linter:latest
```

* You can use the command below in order to create your TLS certificates:

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/CN=wordpress.exercise.com" -keyout wordpress.key -out wordpress.crt  
```

