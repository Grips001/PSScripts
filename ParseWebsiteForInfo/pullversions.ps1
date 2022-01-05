#add tls1.2 to prevent ssl connection errors
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#restmethod each site to gather data
$firefoxESRLatest = (Invoke-RestMethod -Uri https://product-details.mozilla.org/1.0/firefox_versions.json).FIREFOX_ESR
(Invoke-RestMethod -Uri https://www.citrix.com/downloads/workspace-app/windows/workspace-app-for-windows-latest.html) -match '<p>Version: ?(.*)</p' | Out-Null;$citrixLatest = ($Matches[1]).Substring(6)
$proExpLatest = ((((Invoke-RestMethod -Uri https://raw.githubusercontent.com/Ash258/Scoop-Sysinternals/main/bucket/ProcessExplorer.yml) -split '\n')[0]) -split '"')[1] 
(Invoke-RestMethod -Uri https://raw.githubusercontent.com/MicrosoftDocs/Edge-Enterprise/public/edgeenterprise/microsoft-edge-relnote-stable-channel.md) -match '## Version ?(.*):' | Out-Null;$edgeLatest = $Matches[1]
$vmhorizonLatest = (((Invoke-RestMethod -Uri https://docs.vmware.com/en/VMware-Horizon/rn_rss.xml)[0]).subtitle).substring(17)
#add data to hash table
$hash = @{
CitrixWorkspaceApp = $citrixLatest
Edge = $edgeLatest
Firefox = $firefoxESRLatest
ProcessExplorer = $proExpLatest
VMWareHorizon = $vmhorizonLatest
}
#export hash table as json that is github compatible
$hash | ConvertTo-Json -Compress | Out-File .\versions.json -Encoding oem