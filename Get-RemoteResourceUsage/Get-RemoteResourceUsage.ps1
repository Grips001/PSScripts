#assembly needed to make forms
Add-Type -AssemblyName System.Windows.Forms
#build form icon using base64
$iconBase64 = 'AAABAAEAEBAAAAEAIABoBAAAFgAAACgAAAAQAAAAIAAAAAEAIAAAAAAAAAQAAMMOAADDDgAAAAAAAAAAAACFiKX/ZmZt/0dHSP9gYGD/q6uq/5manP+nqrD/n5+f/5ybm/9UVFT/S0pK/1lZWf9XV1f/W1tb/05OTv9cXFz/YGFr/2hpcv9SUlD/YWJi/6SkpP/Fxcb/3+Hm/8/Pz//Gx8j/r7Cy/319f/9XV1f/WFhY/1paWv9PT0//W1tb/1RUU/9WVlX/VFRV/4WFhf+7u7v/z8/P/+Xl5P/l5uf/2Nvj/9/k8P/b4Ov/j5GU/05OTv9aWlr/VFRU/1paWv9YWFj/TU1N/2lpaf/ExMX/tra2/9jY2P/d3dz/29zf/77Czf/g5/f/3eT1/83S3f9fX2D/VFRU/1lZWf9VVVX/VldX/05OTv+bnJ3/2t7n/77Byv+1trf/cXFx/5iYmv/m6fD/4OXx/9zi8f/p7fj/pKWm/1BQT/9ZWVn/UlJS/1ZWV/9WVVX/tLa8/9zi8v/g5fD/09TX/7W1tf/d3Nz/7Ozt/+bn6v/k5uv/6ers/7q7wf9wcYL/XV5e/1JSUv9YWFj/UFBP/6irsv/j6fj/3uHn/+vr7P/u7/D/5ufq/+Tk5P/m5ub/6Ojo/97e3f+io67/qqqv/2hoZ/9TU1P/WVlZ/1FQUf+PkJX/3+Hm/+Dg4f/m5uX/u7y+/8rQ2f/g4eL/3t7e/93f3f/Lzsv/np6e/6enpv93d3f/VFRU/1RUVP9dXV3/d3iB/7m5vf/d3d3/0M/R/7e2t/+xsbL/19bX/8zNzP/DvcP/1srX/8jJyP9zc3T/jY2N/1JSUv9WVlb/WFhX/4+Pjv+4uLn/srOz/8jOyP+ztLP/u7u7/8zLzP+/w7//kH2R/4VPi/+Jhoz/sLO2/6KipP9TU1L/Xl5e/1ZWVv96enr/iYmI/8fHyv+xg7b/jn2M/8bJxv/R0dH/zs7O/8fKyv+4vcD/trnB/6+wtv+oqKn/VlZW/2dnZ/9ZWVn/ampq/3N2dP+dlJ7/gFSG/7i5w//e3+D/ysrN/9ra2v/i4uL/wMHD/4+Qnv+lprP/fHx5/1BQUP9oaG7/Wlpa/2hoaP+rqqr/qauu/7vDxv+ssLf/tra5/6iosP+WmLH/u7vA/7++vP+UlZz/a2x5/ykpJ/9XV1j/i4+o/19fXv9ZWVn/cHBx/66ur/+rqqn/oqKi/4KDj/+SkpX/c3SC/3+AjP9mZmX/QEBA/3Fxcf9DQ0P/V1dX/3t9g/9hYWf/Xl1c/1laXf+Jip7/hYaR/2BgYP9bW17/c3N6/05OTP9YWFf/ampq/0dHR/9cXFz/UFBQ/1dXV/98fIL/e3yE/1hYVv9YWFj/YmNo/4OFm/9rbH7/P0BB/1xcW/9qamv/VlZW/19fX/9SUlL/SkpK/1lZWf9WVlb/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=='
$iconBytes = [Convert]::FromBase64String($iconBase64)
$stream = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
#build form elements
[System.Windows.Forms.Application]::EnableVisualStyles()
$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(400,80)
$Form.text                       = "Copy Remote Resources To ClipBoard"
$Form.TopMost                    = $false
$Form.Icon                       = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))
$Form.BackColor                  = "#FF4169E1"
$Form.ForeColor                  = "#FFF0FFFF"
$txtName                         = New-Object system.Windows.Forms.TextBox
$txtName.multiline               = $false
$txtName.width                   = 315
$txtName.height                  = 20
$txtName.location                = New-Object System.Drawing.Point(5,25)
$txtName.Font                    = New-Object System.Drawing.Font('Consolas',10)
$txtName.BackColor               = "#FFF0FFFF"
$txtName.CharacterCasing         = "Upper"
$btnGo                           = New-Object system.Windows.Forms.Button
$btnGo.text                      = "CPU"
$btnGo.width                     = 60
$btnGo.height                    = 30
$btnGo.location                  = New-Object System.Drawing.Point(325,5)
$btnGo.Font                      = New-Object System.Drawing.Font('Consolas',10)
$btnGo.BackColor                 = "#FFDAA520"
$btnGo2                          = New-Object system.Windows.Forms.Button
$btnGo2.text                     = "MEM"
$btnGo2.width                    = 60
$btnGo2.height                   = 30
$btnGo2.location                 = New-Object System.Drawing.Point(325,40)
$btnGo2.Font                     = New-Object System.Drawing.Font('Consolas',10)
$btnGo2.BackColor                = "#FFDAA520"
$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Server to query?:"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(5,5)
$Label1.Font                     = New-Object System.Drawing.Font('Consolas',10)
$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "Results are sent to the clipboard."
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(3,55)
$Label2.Font                     = New-Object System.Drawing.Font('Consolas',10)
#add elements to form
$Form.controls.AddRange(@($txtName,$btnGo,$btnGo2,$Label1,$Label2))
#make the buttons click, calling a function
$btnGo.Add_Click({ CopyCPU })
$btnGo2.Add_Click({ CopyMEM })
#add fancy mouse over effect to button
$btnGo.Add_MouseEnter({$btnGo.backcolor = "#FF6A5ACD"})
$btnGo2.Add_MouseEnter({$btnGo2.backcolor = "#FF6A5ACD"})
$btnGo.Add_MouseLeave({$btnGo.backcolor = "#FFDAA520"})
$btnGo2.Add_MouseLeave({$btnGo2.backcolor = "#FFDAA520"})
#define button fuctions
function CopyCPU {
$server = $txtName.text
$raw = get-ciminstance win32_PerfFormattedData_PerfProc_Process -filter "Name <> '_Total' and Name <> 'Idle' and Name <> 'System'"  -computername $server | sort-object -descending PercentProcessorTime | select -first 5 | %{
	$proc_id = $_.IDProcess
	$proc = Get-CimInstance Win32_Process -computername $server -Filter "ProcessId=$proc_id"
	$owner = Invoke-CimMethod -InputObject $proc -MethodName GetOwner
	[PSCustomObject]@{
		Name = $_.Name
		'CPU' = $_.PercentProcessorTime
		Owner = "$($owner.Domain)\$($owner.user)"
	}
}
$results = ($raw | Out-String).trim()
$results | clip
$txtName.text = ""
Remove-CimInstance -InputObject $raw
}
function CopyMEM {
$server = $txtName.text
$raw = Get-CimInstance win32_process -computername $server | Sort-Object -Descending WorkingSetSize | select -First 5 | %{
	$owner = Invoke-CimMethod -InputObject $_ -MethodName GetOwner
	[PSCustomObject]@{
		Name = $_.Name
		'Usage (MB)' = [math]::Round($_.WorkingSetSize / 1024kb,2)
		Owner = "$($owner.Domain)\$($owner.user)"
	}
}
$results = ($raw | Out-String).Trim()
$results | clip
$txtName.text = ""
Remove-CimInstance -InputObject $raw
}
[void]$Form.ShowDialog()
$stream.Dispose()
$Form.Dispose()