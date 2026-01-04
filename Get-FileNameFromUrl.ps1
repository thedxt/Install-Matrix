# Get-FileNameFromUrl.ps1
#
# Function: Get-FileNameFromUrl
#
# Contributors: @theDXT
# Created: 2024-Oct-10
# Last Modified: 2026-Jan-04
# Version 1.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
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

