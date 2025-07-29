# Backup-App-Data.ps1
#
# Function: Backup-App-Data
#
# Contributors: @theDXT
# Created: 2024-11-05
# Last Modified: 2024-11-05
# Version 1.0.0
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

Write-Verbose "Found $($user.FullName)$($location)"
Write-Verbose "Starting Backup"
Copy-Item -path "$($user.FullName)$($location)" -destination "$($user.FullName)$($location)_$time" -Recurse -Force
Write-Verbose "Backup Completed for $($user.FullName)$($location) to $($user.FullName)$($location)_$time"
}

else
# if not found move along
{
Write-Verbose "Did not Find $($user.FullName)$($location)"
Write-Verbose "skipping $user"
}

}

}