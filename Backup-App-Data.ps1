# Backup-App-Data.ps1
#
# Function: Backup-App-Data
#
# Contributors: @theDXT
# Created: 2024-Nov-05
# Last Modified: 2026-Jan-04
# Version 1.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
#
# Description:
#   looks for the defined app data folder for each user account in C:\users and if found copies it to a new folder in appdata with the current data and time
#
# Parameters:
#   - location <string>
#       The app data path to backup
#       Example Backup-App-Data -location "\AppData\Roaming\remarkable"



function Backup-App-Data

{

    param (
        [string]$location
    )

# get the users minus Default and Administrator and Public
$list_of_users = Get-ChildItem -Path $Env:SystemDrive\Users | Where-Object {($_.Name -notlike "Public") -and ($_.Name -notlike "Administrator") -and ($_.Name -notlike "Default")}

# loop for each user found
Foreach ($user in $list_of_users)

{
# check if the app data path exists
if (Test-Path "$($user.FullName)$($location)")

# if found back it up
{

Write-Host "Found $($user.FullName)$($location)"
Write-Host "Starting Backup"
Copy-Item -path "$($user.FullName)$($location)" -destination "$($user.FullName)$($location)_$time" -Recurse -Force
Write-Host "Backup Completed for $($user.FullName)$($location) to $($user.FullName)$($location)_$time"
}

else
# if not found move along
{
Write-Host "Did not Find $($user.FullName)$($location)"
Write-Host "skipping $user"
}

}


}
