# Sonar Qube Sample

## Prerequisites
- Requires Microsoft Windows 10 Professional or Enterprise 64-bit
- Build Tools for Visual Studio 2017 (https://www.visualstudio.com/downloads/)
- DotCover -> download at Jetbains or as Visual Studio Extension

## Installation Sonar Qube Container

### Install Docker For Windows
- https://www.docker.com/docker-window
- Check Docker is running in System Tray (and is running in Linux Mode -> Button "Switch to Window Containers" is visible)

### Download and Start SonarQube Container
- Start Powershell
- Execute `docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube`

## Installation Sonar Qube Scanner
- Download Sonar Cube MSBuild Scanner (https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/4.3.1.1372/sonar-scanner-msbuild-4.3.1.1372-net46.zip)
- Set Path Environment Variable for MSBuild Scanner e.g. `C:\Program Files\SonarScannerMsBuild`


## Starting the Sonar Qube Server Locally
- Find `test.bat` in Visual Studio Solution with all parameters!
- Start Browser and navigate to localhost:9000
- Login with admin/admin
- enter some string to create the `SONAR_LOGIN_TOKEN` -> copy token to test.bat file
- enter some project name to create `SONAR_PROJECT_NAME` -> copy project name to test.bat
- Skip Intro

## Start Tracking Coverage
- Check DotCover installation Path in `test.bat`
- Start Visual Studio Developer Command Line.
- change to solution folder.
- run `test.bat`
- wait for results
- in case of failure remove `.sonarqube` folder
- check results in web browser.

## Restarting the Container
- Start Powershell
- Execute `docker stop sonarqube` -> stop the container
- Execute `docker rm sonarqube` -> remove the container with all content
- Execute `docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube` -> restart fresh

## Remove Sonar Qube Container Image
- Start Powershell
- Execute `docker image rm sonarqube`