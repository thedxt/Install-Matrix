# Get-FinalUrl.ps1
#
# Function: Get-FinalUrl
#
# Contributors: @theDXT
# Created: 2024-10-10
# Last Modified: 2024-10-10
# Version 1.0.0
#
# Description:
#   Get the final URL after redirection

function Get-FinalUrl {
    param (
        [string]$url
    )
    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect = $false
    $response = $request.GetResponse()
    while ($response.StatusCode -eq 302 -or $response.StatusCode -eq 301) {
        $url = $response.GetResponseHeader("Location")
        $request = [System.Net.WebRequest]::Create($url)
        $request.AllowAutoRedirect = $false
        $response = $request.GetResponse()
    }
    return $url
}