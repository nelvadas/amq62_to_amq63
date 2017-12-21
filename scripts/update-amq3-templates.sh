#!/bin/bash
#$1: template version

oc replace -n openshift -f  'https://raw.githubusercontent.com/jboss-openshift/application-templates/ose-v'$1'/jboss-image-streams.json'
oc -n openshift import-image jboss-amq-63

for template in amq62-basic.json \
 amq63-persistent-ssl.json \
 amq63-basic.json \
 amq63-ssl.json \
 amq63-persistent.json;
 do
 oc replace -n openshift -f  'https://raw.githubusercontent.com/jboss-openshift/application-templates/ose-v'$1'/amq/${template}'
 done
