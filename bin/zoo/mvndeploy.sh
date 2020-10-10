#!/bin/bash

GROUP=$1

ID=thirdparty
URL=http://10.1.2.32/nexus/repository/thirdparty/

mvn deploy:deploy-file "-DgroupId=$GROUP" -DartifactId=jzsms -Dversion=201503 -Dpackaging=jar -Dfile=jzsms201503.jar "-DrepositoryId=$ID" "-Durl=$URL"
