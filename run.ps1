#!/usr/bin/env pwsh

$repository='https://github.com/toromuu/TourGallery.git'

$workspace='app-workspace'


$Folders = 'jenkins/jenkins_home',
            'sonarqube/conf',
            'sonarqube/data',
            'sonarqube/extensions',
            'sonarqube/lib/bundled-plugins',
            'sonarqube-db/data'

$FoldersPermissions = '1000:1000',
		      '999:999',
		      '999:999',
		      '999:999',
		      '999:999',
		      '999'


ForEach ($Folder in $Folders)
    {
        mkdir -p ./volumes/$Folder
	wsl chown $FoldersPermissions[$Folders.IndexOf($Folder)] ./volumes/$Folder
    }



git clone $repository  $workspace

# Add devcontainer, Jenkinsfile and post-commit files

if (Test-Path ./.devcontainer) {
    mv ./.devcontainer ./${workspace}/
    mv ./post-commit ./${workspace}/.git/hooks/
}

powershell wsl -d docker-desktop "sysctl -w vm.max_map_count=262144"

docker-compose build

docker-compose up -d





