# Get-FinalUrl.ps1
#
# Function: Get-FinalUrl
#
# Contributors: @theDXT
# Created: 2024-Oct-10
# Last Modified: 2026-Jan-04
# Version 1.0.1
#
# Script URI: https://github.com/thedxt/Install-Matrix
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
