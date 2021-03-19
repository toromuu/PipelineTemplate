#!/usr/bin/env pwsh

$repository='https://github.com/toromuu/TourGallery.git'

$workspace='app-workspace'

git clone $repository  $workspace

# Add devcontainer, Jenkinsfile and post-commit files

if(![System.IO.File]::Exists(./.devcontainer)){
    throw "Clone already done."
}
else {
    mv ./.devcontainer ./${workspace}/
    mv ./post-commit ./${workspace}/.git/hooks/
}


docker-compose build

docker-compose up -d





