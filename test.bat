@echo off
SET TEST_FOLDER=BusinessLogic.Test\bin\Debug
SET TEST_FILE=BusinessLogic.Test.dll

SET SONAR_KEY=SonarQubeSample
SET SONAR_PROJECT_NAME=Calcualtor
SET SONAR_PROJECT_VERSION=1.0
SET SONAR_URL=http://localhost:9000
SET SONAR_LOGIN_TOKEN=ea3de38a8ec0ac5b6ed7e9d1c45bd0527e20e1f3
SET SONAR_FOLDER=.sonarqube\results
SET COVERAGE_FOLDER=covarageReport

@echo --------------- Start SonarQube Tracking ---------------
SonarScanner.MSBuild.exe begin^
 /k:"%SONAR_KEY%"^
 /d:sonar.host.url="%SONAR_URL%"^
 /d:sonar.login="%SONAR_LOGIN_TOKEN%"^
 /d:sonar.cs.dotcover.reportsPaths="%SONAR_FOLDER%\%COVERAGE_FOLDER%\dotCover.html"^
 /n:"%SONAR_PROJECT_NAME%"^
 /v:"%SONAR_PROJECT_VERSION%"

@echo --------------- Start MSBuild ---------------
MsBuild.exe /t:Rebuild

@echo --------------- Start dotCover ---------------
"%LOCALAPPDATA%\JetBrains\Installations\dotCover11\dotCover.exe"^
 analyse /ReportType=HTML^
 /Output="%SONAR_FOLDER%\%COVERAGE_FOLDER%\dotCover.html"^
 "/TargetExecutable=%VSINSTALLDIR%\Common7\IDE\CommonExtensions\Microsoft\TestWindow\vstest.console.exe"^
 /TargetWorkingDir=.^
 "/TargetArguments=%TEST_FOLDER%\%TEST_FILE%"
 
@echo --------------- Generate Report ---------------
SonarScanner.MSBuild.exe end /d:sonar.login="%SONAR_LOGIN_TOKEN%"