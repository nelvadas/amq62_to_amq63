# AMQ62 to AMQ63 Migration

The playbooks migrates specific applications built on top of jboss-amq-63 image  to jboss-amq-63

## Processing
* Connect to an Openshift Cluster using ```oc login```
* Verify the application buildConfig and deploymentConfig exists
* back up  the existing bc and dc in a tmp/namespace/TIMESTAMP/ directory ( yaml spec)
* Patch the application build config to rely on the new AMQ63 image
* Create the drainer deployment config
* Create te amq-service-account and associate it to dc/amq62-app and dc/amq63-drainer 
* Start a new build to deploy the new amq62 application 


## Usage

### Imort the AMQ63 Templates

TODO

### Upgrade a specific application

*  ```ansible-playbook upgrate_amq62_to_amq63.yml -e namespace=myProject -e buildConfig=app1BC-e deploymentConfig=broker-amq62-amq -e "image=jboss-amq-63:1.1" ```