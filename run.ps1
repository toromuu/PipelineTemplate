#!/usr/bin/env pwsh

$repository='https://github.com/toromuu/TourGallery.git'

$workspace='app-workspace'


git clone $repository  $workspace

# Add devcontainer, Jenkinsfile and post-commit files

if (Test-Path ./.devcontainer) {
    mv ./.devcontainer ./${workspace}/
    mv ./post-commit ./${workspace}/.git/hooks/
}

mv ./jenkins.pem ./jenkins/jenkins_as_code/jobs/pipeline/pipeline_def/

powershell wsl -d docker-desktop "sysctl -w vm.max_map_count=262144"

docker-compose build

docker-compose up -d





