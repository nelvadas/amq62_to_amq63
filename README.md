# AMQ62 to AMQ63 Migration

The playbooks migrates specific applications built on top of jboss-amq-63 image  to jboss-amq-63

## Processing
* Connect to an Openshift Cluster using ```oc login```
* Verify the application buildConfig and deploymentConfig exists
* Ensure the playbook is started by ```admin / system:admin```
* back up  the existing bc and dc in a ```./tmp/namespace/TIMESTAMP/``` directory ( yaml spec)
* Create the amq-service-account
* Patch the application build config to rely on the new AMQ63 image
* Create the drainer deployment config
* Set ```AMQ_USER```, ```AMQ_PASSWORD```, ```AMQ_MESH_SERVICE_NAME``` on drainer
* Add the existing Broker Persistent volume claim to the drainer
* use the  amq-service-account in  ```dc/amq62-app``` and ```dc/amq63-drainer``` 
* Start a new build to deploy the new amq62 application 


## Usage

### Imort the AMQ63 Templates

TODO
  ```ansible-playbook upgrate-ocp-templates.yml```

### Upgrade a specific application/project

  ```ansible-playbook upgrade-broker.yml -e namespace=myProject -e buildConfig=app1BC-e deploymentConfig=broker-amq62-amq -e image='jboss-amq-63:1.1' ```

The following parameters are expected
* *namespace* : the project namespace 
* ```buildConfig```: The application BuildConfig with amq62
* ```deploymentConfig```: The app deployment config
* oc_cluster: Openshift Cluster address , default Minishift host  ``` https://192.168.99.100:8443```
* oc_user: user to authenticate with   default ```admin```
* oc_password: user password: default to ```admin``` 
