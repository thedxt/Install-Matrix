# Restore-App-Data.ps1
#
# Function: Restore-App-Data
#
# Contributors: @theDXT
# Created: 2024-11-05
# Last Modified: 2024-11-05
# Version 1.0.0
#
# Description:
#   looks for the defined app data backup from the Backup-App-Data function for each user account in C:\users 
#   if found it restores it to the same location. If the folder doe not exist it creates the folder first.
#   It uses force to make sure the backup is restored
#
# Parameters:
#   - location <string>
#       The app data path to restore
#       Example Restore-App-Data -location "\AppData\Roaming\remarkable"

function Restore-App-Data

{

    param (
        [string]$location
    )

# get the users minus Default and Administrator and Public
$list_of_users = Get-ChildItem -Path $Env:SystemDrive\Users | Where-Object {($_.Name -notlike "Public") -and ($_.Name -notlike "Administrator") -and ($_.Name -notlike "Default")}

# loop for each user found
Foreach ($user in $list_of_users)

{
# check if the backup exists for the user
if (Test-Path "$($user.FullName)$($location)_$time")

# if found restore the backup
{
Write-Verbose "Found $($user.FullName)$($location)_$time"
Write-Verbose "restoring $($user.FullName)$($location)_$time to Original Location"


if (-Not (Test-Path "$($user.FullName)$($location)")) {
        # create folder if backup exists but folder does not
        Write-Verbose "The $($user.FullName)$($location) was not found"
        Write-Verbose "creating $($user.FullName)$($location)"
        New-Item -ItemType Directory -Path "$($user.FullName)$($location)" | out-null
        Write-Verbose "$($user.FullName)$($location) has been created"
        #copy the backup into the folder
        Write-Verbose "Restoring $($user.FullName)$($location)_$time to $($user.FullName)$($location)"
        Copy-Item -path "$($user.FullName)$($location)_$time\*" "$($user.FullName)$($location)" -Force -Recurse
        Write-Verbose "Restore Completed"
    }else{
    # if folder already exists copy the files back
    Write-Verbose "The $($user.FullName)$($location) was found"
    Write-Verbose "Restoring $($user.FullName)$($location)_$time to $($user.FullName)$($location)"
    Copy-Item -path "$($user.FullName)$($location)_$time\*" "$($user.FullName)$($location)" -Force -Recurse
    Write-Verbose "Restore Completed"
    }


}

else
#if no backup found do nothing
{
Write-Verbose "Did not Find $($user.FullName)$($location)_$time"
Write-Verbose "skipping $user"
}

}

}