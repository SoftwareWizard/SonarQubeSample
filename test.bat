@echo off

SET TEST_FOLDER=BusinessLogic.Test\bin\Debug
SET TEST_FILE=BusinessLogic.Test.dll

SET SONAR_KEY=SimonsUniqueProjectKey
SET SONAR_PROJECT_NAME=SonarQubeSample
SET SONAR_PROJECT_VERSION=1.0
SET SONAR_URL=http://localhost:9000
SET SONAR_LOGIN_TOKEN=d0d7ed429d24356f8c6321ff0d0b359b2b430d57
SET SONAR_FOLDER=.sonarqube\results
SET COVERAGE_FOLDER=covarageReport
SET ANALYSER_FOLDER=analysisReport

@echo --------------- Start SonarQube Tracking ---------------
SonarScanner.MSBuild.exe begin^
 /k:"%SONAR_KEY%"^
 /n:"%SONAR_PROJECT_NAME%"
 /d:sonar.projectVersion="%SONAR_PROJECT_VERSION%"
 /d:sonar.host.url="%SONAR_URL%"^
 /d:sonar.login="%SONAR_LOGIN_TOKEN%"^
 /d:sonar.cs.dotcover.reportsPaths="%SONAR_FOLDER%\%COVERAGE_FOLDER%\dotCover.html"^
 /d:sonar.cs.analyzer.projectOutPaths="%SONAR_FOLDER%\%ANALYSER_FOLDER%"

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