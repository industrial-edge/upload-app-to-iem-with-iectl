# Uplaod App to IEM with IE Publisher CLI 

- [Uplaod App to IEM with IE Publisher CLI](#uplaod-app-to-iem-with-ie-publisher-cli)
  - [Prerequisites](#prerequisites)
    - [Expose Docker daemon](#expose-docker-daemon)
    - [Install IE Publisher CLI](#install-ie-publisher-cli)
  - [Create project and application in IEM](#create-project-and-application-in-iem)
  - [Build Docker images](#build-docker-images)
  - [Customize shell script and upload app to IEM](#customize-shell-script-and-upload-app-to-iem)
  

## Prerequisites 

*Note: Linux VM with docker and docker-compose installed is used in this example*

### Expose Docker daemon 

In order to run shell script for this example, you need to expose docker daemon TCP port 2375. To do that, follow these instructions: 

1. Open terminal on the Linux device. 
2. Use the command sudo systemctl edit docker.service to open an override file for docker.service in a text editor.
```bash
sudo systemctl edit docker.service
```

3. Add or modify the following lines, substituting your own values.
```bash
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375
```
In this example the API will listen at `127.0.0.1:2375`. You can change the IP according to your setup, eg if you want to reach the docker engine from a external host, enter the external IP of the host.

4. Save the file.
5. Reload the systemctl configuration.
```bash
sudo systemctl daemon-reload
```
6. Restart Docker
```bash
sudo systemctl restart docker.service
```
7. Check if the new configuration was applied:
```bash
sudo docker info
```
The output should state that the API is accessible on your IP and Port.

__Warning__ : Access to the remote API is equivalent to root access on the host. Only do this in a trusted environment.

### Install IE Publisher CLI 

To install the IE Publisher CLI, follow these instructions: 


1. Download the IE Publisher CLI executable file from [Industrial Edge Hub](https://iehub.eu1.edge.siemens.cloud/downloads) and copy the file to your device. Extract the files from the zip file. 

2. Open terminal in the directory with the IE Publisher CLI and run this command to make the IE Publisher CLI executable.  

    ```bash
    sudo install ./ie-app-publisher-linux /usr/bin/
    ```

3. If you see the publisher CLI version number, you have successfully installed IE Publisher CLI on your device. 

## Create project and application in IEM 
*Prerequisites:*\
*- IEM installed and configured*

1. Go to the "Applications" section of your Edge Management. 

2. Click on "Create Project" button in the right upper corner. 

3. Provide necessary information for your project 

    ```txt
    - Project Name
    - Description 
    - Company information (if needed)
    ```

4. Click on "Create" to create the project. 

<img src="graphics/create_project.gif" width="1000"/>


5. Go to your created project and click on "Create application"

6. Fill in the form for your application 

    ```txt
    - Application Name 
    - Repository Name
    - Website
    - Description
    - Select icon
    ```

7. Click on "Create" button. Your application is successfully created.

<img src="graphics/create_app.gif" width="1000"/>

## Build Docker images 

1. Copy the [src](../src) folder with all application files to your Linux device. 
2. Open up your terminal.
3. Build docker images by running these commands:
4. 
    ```bash
    cd ./src/app
    sudo docker-compose build
    ```
5. Docker image for the application within this example are build in your local docker engine. 

## Customize shell script and upload app to IEM
*Note: VS Code is used as a development enviroment*

1. Open the shell [script](../src/script.sh) in your development enviroment. 
2. In order to succefully upload this application to your IEM, you need to modify the provided shell script. You can do this by setting several enviroment variables in the beginning of [script](../src/script.sh) by modifying variables in angle brackets:  

    ```bash
    export IE_URL="https://<ip>:9443"
    export IE_USER="<iem-username>"
    export IE_PASSWORD="<iem-password>"
    export APP_ID="<app-ID>"
    export COMPOSE_PATH="<path-to-docker-compose>"
    ```
**Important Notes:**\
*- Use the production [docker-compose.prod.yml](../src/app/docker-compose.prod.yml) file* \
*- App ID can be found in IEM under "My Projects -> Application Details -> Show Keys"*

3. When you are finished with modifying shell script, you can start the shell script to tigger the uplaod process by running this command: 

    ```bash
    cd .src/
    sh script.sh
    ```
4. If your configuration is correct, you should get the notofication that you application was uploaded successfully. 

