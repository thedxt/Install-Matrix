# Get-FileNameFromUrl.ps1
#
# Function: Get-FileNameFromUrl
#
# Contributors: @theDXT
# Created: 2024-10-10
# Last Modified: 2024-10-10
# Version 1.0.0
#
# Description:
#   Get the file name from the get-finalurl function
#
# Function to get the file name from the URL
function Get-FileNameFromUrl {
    param (
        [string]$url
    )
    $finalUrl = Get-FinalUrl -url $url
    $uri = New-Object System.Uri($finalUrl)
    return [System.IO.Path]::GetFileName($uri.LocalPath)
}
