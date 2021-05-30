#!/usr/bin/env pwsh

Param(
    [string] $Repo
)

# Demo repository
$repository='https://github.com/toromuu/TourGallery.git'

if(![string]::IsNullOrEmpty($Repo)){
$repository=$Repo
}

# Check aws secret key
if (Test-Path ./jenkins.pem) {
    mv ./jenkins.pem ./jenkins/jenkins_as_code/jobs/pipeline/pipeline_def/
} else {
    Write-Host ".Pem Aws Key is required"
    exit
}

$workspace='app-workspace'

# Clone repository
git clone $repository  $workspace

# Move the repository to Visual Studio Dev Container Folder
if (Test-Path ./.devcontainer) {
    mv ./.devcontainer ./${workspace}/
    mv ./post-commit ./${workspace}/.git/hooks/
}

# Increase vm for sonarQube
powershell wsl -d docker-desktop "sysctl -w vm.max_map_count=262144"

# Build the docker image
docker-compose build

# Launch Docker container
docker-compose up -d





