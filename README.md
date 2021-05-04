# CLI application example



Automate process of uploading apps using IE Publisher CLI

- [CLI application example](#cli-application-example)
  - [Description](#description)
    - [Overview](#overview)
    - [General task](#general-task)
  - [Requirements](#requirements)
    - [Prerequisites](#prerequisites)
    - [Used components](#used-components)
  - [Installation steps](#installation-steps)
  - [Documentation](#documentation)
  - [Contribution](#contribution)
  - [Licence & Legal Information](#licence--legal-information)

## Description

###  Overview
This application example shows how to use IE Publisher CLI to automatically upload applications to the Industrial Edge Management.

### General task
The main goal of this example is to show how to create shell script to automatically upload applications to IEM. Provided shell script can run as a standalone script, in docker image or even can be implemented in CI/CD pipeline.


## Requirements

###  Prerequisites

- Installed Industrial Edge Management
- Linux VM with docker and docker-compose installed
- Linux VM has connection to IEM


### Used components

- Industrial Edge Device V 1.2.0-56
- Industrial Edge Management V 1.2.14
- VM Ubuntu 20.04
- Docker 19.03.13
- IE Publisher CLI V 1.2.8


## Installation steps
To create shell script with IE Publisher CLI commands to automatically upload app to IEM, follow the steps in [docs](../docs/installation.md). The documentation describes how to install IE Publisher CLI on Ubuntu distribution version of Linux and how to run a shell script to uplaod new application version to your IEM. The application used for this example is a simple web server hosting by nginx.


## Documentation

- You can find further documentation and help in the following links
  - [Industrial Edge Hub](https://iehub.eu1.edge.siemens.cloud/#/documentation)
  - [Industrial Edge Forum](https://www.siemens.com/industrial-edge-forum)
  - [Industrial Edge landing page](https://new.siemens.com/global/en/products/automation/topic-areas/industrial-edge/simatic-edge.html)
  
## Contribution
Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## Licence & Legal Information
Please read the [Legal information](LICENSE.md)