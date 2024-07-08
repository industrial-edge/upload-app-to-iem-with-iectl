# Upload app to IEM with IECTL

Automate process of uploading apps to IEM using IECTL.
- [Upload app to IEM with IECTL](#upload-app-to-iem-with-iectl)
  - [Description](#description)
    - [Overview](#overview)
    - [General task](#general-task)
  - [Requirements](#requirements)
    - [Prerequisites](#prerequisites)
    - [Used components](#used-components)
  - [Installation steps](#installation-steps)
  - [Documentation](#documentation)
  - [Contribution](#contribution)
  - [License and Legal Information](#license-and-legal-information)
  - [Disclaimer](#disclaimer)

## Description

### Overview

This application example shows how to use IECTL to automatically upload applications to the Industrial Edge Management.

### General task

The main goal of this example is to show how to create shell script with CLI commands to automatically upload applications to IEM. Provided shell script can run as a standalone script, in docker image or can be even implemented in CI/CD pipeline.

## Requirements

### Prerequisites

- Installed Industrial Edge Management
- Linux VM with docker and docker-compose installed
- Linux VM has connection to IEM

### Used components

- Industrial Edge Device V 1.2.0-56
- Industrial Edge Management V 1.5.5-2
- IECTL V 2.7.10
- VM Ubuntu 20.04
- Docker 20.10.17

## Installation steps

To create shell script with IECTL commands to automatically upload app to IEM, follow the steps in [docs](./docs/installation.md). The documentation describes how to install IECTL on Ubuntu distribution version of Linux and how to run a shell script to upload new application version to your IEM. The application used for this example is a simple web server hosting by nginx.

## Documentation
 
- You can find further documentation and help in the following links
  - [Industrial Edge Hub](https://iehub.eu1.edge.siemens.cloud/#/documentation)
  - [Industrial Edge Forum](https://forum.mendix.com/link/space/industrial-edge)
  - [Industrial Edge landing page](https://new.siemens.com/global/en/products/automation/topic-areas/industrial-edge/simatic-edge.html)
  - [Industrial Edge GitHub page](https://github.com/industrial-edge)
  - [Industrial Edge documentation page](https://docs.eu1.edge.siemens.cloud/index.html)
  
## Contribution

Thank you for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section.
Additionally everybody is free to propose any changes to this repository using Pull Requests.

If you haven't previously signed the [Siemens Contributor License Agreement](https://cla-assistant.io/industrial-edge/) (CLA), the system will automatically prompt you to do so when you submit your Pull Request. This can be conveniently done through the CLA Assistant's online platform.
Once the CLA is signed, your Pull Request will automatically be cleared and made ready for merging if all other test stages succeed.

## License and Legal Information

Please read the [Legal information](LICENSE.txt).

## Disclaimer

IMPORTANT - PLEASE READ CAREFULLY:

This documentation describes how you can download and set up containers which consist of or contain third-party software. By following this documentation you agree that using such third-party software is done at your own discretion and risk. No advice or information, whether oral or written, obtained by you from us or from this documentation shall create any warranty for the third-party software. Additionally, by following these descriptions or using the contents of this documentation, you agree that you are responsible for complying with all third party licenses applicable to such third-party software. All product names, logos, and brands are property of their respective owners. All third-party company, product and service names used in this documentation are for identification purposes only. Use of these names, logos, and brands does not imply endorsement.
