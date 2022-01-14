function True-Random{
param([int]$min,[int]$max)
(invoke-restmethod ndbc.noaa.gov/data/realtime2) -match '<a href=" ?(.*)</a>' | Out-Null;$raw=$Matches[1];$dataSet=Get-Random (([regex]::Matches($raw, '(?<="\>).+?(?=\<)').Value) -like "*.adcp")
$seedLong = (Invoke-RestMethod ndbc.noaa.gov/data/realtime2/$dataSet) -replace '\D+'
$seedRan = Get-Random -Maximum ($seedLong.Length+1) -Minimum 11
$seedStart = $seedRan - 8
$seed = -join $seedLong[$seedStart..$seedRan]
Get-Random -Maximum $max -Minimum $min -SetSeed $seed
}