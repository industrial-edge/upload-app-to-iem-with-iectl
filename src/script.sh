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
ie-app-publisher-linux em li -u $IEM_URL -e $IEM_USERNAME -p $IEM_PASSWORD

echo "-----------------------------------------UPLOAD APP TO IEM------------------------------------------------"

# Application version management
version=$(ie-app-publisher-linux em app dt -a $APP_ID -p | \
    python3 -c "import sys, json; print(json.load(sys.stdin)['versions'][0]['versionNumber'])")
echo 'old Version: '$version
version_new=$(echo $version | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
echo 'new Version: '$version_new

# Create and upload application version to IEM 
ie-app-publisher-linux em app cuv -a $APP_ID -v $version_new -y $DOCKER_COMP_PATH -n '{"hello-edge":[{"name":"hello-edge","protocol":"HTTP","port":"80","headers":"","rewriteTarget":"/"}]}' -s 'hello-edge' -t 'FromBoxReverseProxy' -u "hello-edge" -r "/"
ie-app-publisher-linux em app uuv -a $APP_ID -v $version_new

