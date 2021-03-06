# AMQ62 to AMQ63 Migration

The playbooks migrates specific applications built on top of jboss-amq-63 image  to jboss-amq-63

## Processing
* Verify the application buildConfig and deploymentConfig exists
* Ensure the playbook is started by ```admin / system:admin``` when requires
* back up  the existing bc and dc in a ```./tmp/namespace/TIMESTAMP/``` directory ( yaml spec)
* Create the amq-service-account
* Patch the application build config to rely on the new AMQ63 image
* Create the drainer deployment config
* Set ```AMQ_USER```, ```AMQ_PASSWORD```, ```AMQ_MESH_SERVICE_NAME``` on drainer
* Add the existing Broker Persistent volume claim to the drainer
* Update the drainer to use the application imagestream: container and triggers
* use the  amq-service-account in  ```dc/amq62-app``` and ```dc/amq63-drainer``` 
* Start a new build to deploy the new amq62 application 


## Usage

### Imort the AMQ63 Templates
This playbook install/replace existing amq63 template on your OCP installation with the templates provided at 
  ``` https://github.com/jboss-openshift/application-templates/tree/ose-${VERSION}/amq``

 Use the following command to install tempaltes from ```https://github.com/jboss-openshift/application-templates/tree/ose-v1.4.5/amq```

  ```ansible-playbook update-amq63-templates.yml -e version=1.4.5```

### Upgrade a specific application/project

  ```ansible-playbook upgrade-broker.yml -e namespace=myProject -e buildConfig=app1BC-e deploymentConfig=broker-amq62-amq -e image='jboss-amq-63:1.1' ```

The following parameters are expected
* ```namespace``` : the project namespace 
* ```buildConfig```: The application BuildConfig with amq62
* ```deploymentConfig```: The app deployment config
* ```oc_cluster```: Openshift Cluster address , default Minishift host  ``` https://192.168.99.100:8443```
* ```oc_user```: user to authenticate with   default ```admin```
* ```oc_password```: user password: default to ```admin``` 
