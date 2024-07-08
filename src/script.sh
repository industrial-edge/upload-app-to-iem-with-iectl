#DON'T FORGET TO BUILD THE IMAGE BEFORE

# IEM configuration variables export IEM_USER="ivan.castro-bernaza@siemens.com"
export IEM_USER="<iem_user>"
export IEM_URL="<iem_URL>"

# Application configuration variables
export APP_NAME="<App_name>" # Application name
export APP_REPO="<App_repo>" # Applications repository (unique)

# IECTL environmental variables
export IE_SKIP_CERTIFICATE=true
export EDGE_SKIP_TLS=1

# Project envirinmental variables 
export PROJECT_PATH_PREFIX="<Absolute Path to src files>" # Prefix of the absolute path where the project is inside of your development environment


echo "---------------------------Creating publisher configuration---------------------------"
iectl config add publisher \
    --name "publisherdev" \
    --dockerurl "http://127.0.0.1:2375" \
    --workspace "$PROJECT_PATH_PREFIX/workspace" 

echo "---------------------------Initializing workspace---------------------------"
cd workspace
iectl publisher workspace init

echo "---------------------------Creating application---------------------------"
iectl publisher standalone-app create \
            --reponame $APP_REPO \
            --appdescription "application description"  \
            --iconpath "$PROJECT_PATH_PREFIX/appicon/icon.png" \
            --appname $APP_NAME

echo "---------------------------Creating application version---------------------------"
# Version managment 
version=$(iectl publisher standalone-app version list -a $APP_NAME -k "versionNumber" | \
        python3 $PROJECT_PATH_PREFIX/script/getAppVersion.py)

version_new=$(echo $version | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')
echo 'new Version: '$version_new

iectl publisher standalone-app version create \
            --appname $APP_NAME \
            --changelogs "initial release" \
            --yamlpath "$PROJECT_PATH_PREFIX/app/docker-compose.prod.yml" \
            --versionnumber $version_new \
            -n '{"hello-edge":[{"name":"hello-edge","protocol":"HTTP","port":"80","headers":"","rewriteTarget":"/"}]}' \
            -s "hello-edge" \
            -t "FromBoxReverseProxy" \
            -u "hello-edge" \
            -r "/"

echo "---------------------------Creating IEM configuration---------------------------"
iectl config add iem  \
         --name "iemdev" \
         --url $IEM_URL \
         --user $IEM_USER \
         --password $IEM_PASSWORD  

echo "---------------------------Uploading app to IEM---------------------------"
iectl publisher app-project upload catalog \
        --appname $APP_NAME \
        -v $version_new

