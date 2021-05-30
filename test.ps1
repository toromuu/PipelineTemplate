#!/usr/bin/env pwsh


Param(
    [string] $Repo
)

$repository='https://github.com/toromuu/TourGallery.git'

if(![string]::IsNullOrEmpty($Repo)){
$repository=$Repo
}


Write-Host "$repository"