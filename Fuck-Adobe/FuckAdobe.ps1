get-service | ?{$_.DisplayName -like "*Adobe*"} | Stop-Service -Force
get-process | ?{$_.ProcessName -Like "*Adobe*" -or $_.ProcessName -Like "*CC*" -or $_.ProcessName -Like "*Creative*" -or $_.ProcessName -Like "*CoreSync*"} | Stop-Process -Force
pause