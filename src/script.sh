# Copyright 2020 Siemens AG
# This file is subject to the terms and conditions of the MIT License.  
# See LICENSE file in the top-level directory.

# Set envriroment variables 
export IE_URL="https://<ip>:9443"
export IE_USER="<iem-username>"
export IE_PASSWORD="<iem-password>"
export APP_ID="<app-ID>"
export COMPOSE_PATH="<path-to-docker-compose>/docker-compose.prod.yml"


# List IE Publisher CLI version 
ie-app-publisher-linux -V

# Workspace initialization
echo "-----------------------------------------INIT WORKSPACE---------------------------------------------------"
mkdir workspace 
cd workspace 
ie-app-publisher-linux ws i

# Connection to docker engine 
echo "-----------------------------------------CONNECT TO DOCKER ENGINE-----------------------------------------"
ie-app-publisher-linux de c -u http://localhost:2375

# Portal login
echo "-----------------------------------------IEM LOGIN--------------------------------------------------------"
export IE_SKIP_CERTIFICATE=true # DO THIS IN TRUSTED ENVIROMENT ONLY! 
ie-app-publisher-linux em li -u $IE_URL -e $IE_USER -p $IE_PASSWORD

echo "-----------------------------------------UPLOAD APP TO IEM------------------------------------------------"

# application version management
version=$(ie-app-publisher-linux em app dt -a $APP_ID -p | \
        python3 -c "import sys, json; print(json.load(sys.stdin)['versions'][0]['versionNumber'])")

if [ -z "$version" ]
then
    version_new=0.0.1
    echo 'New application created with version: '$version_new
else
    echo 'old Version: '$version
    version_new=$(echo $version | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
    echo 'new Version: '$version_new
fi


# Create and upload application version to IEM 
ie-app-publisher-linux em app cuv -a $APP_ID -v $version_new -y $COMPOSE_PATH -n '{"hello-edge":[{"name":"hello-edge","protocol":"HTTP","port":"80","headers":"","rewriteTarget":"/"}]}' -s 'hello-edge' -t 'FromBoxReverseProxy' -u "hello-edge" -r "/"
ie-app-publisher-linux em app uuv -a $APP_ID -v $version_new