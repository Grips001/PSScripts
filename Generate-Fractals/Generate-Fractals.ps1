function generateRanBMP{
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
# Global Values
$global:colorsValue = (Get-Random -minimum 1000 -maximum 20000)
$global:iterationsValue = (Get-Random -minimum 5000 -maximum 150000)
# Output Bitmap Image
$bitmap = New-Object System.Drawing.Bitmap(512, 512)
$bitmapGraphics = [System.Drawing.Graphics]::FromImage($bitmap) 
$bitmapGraphics.Clear("Black")
$a = (Get-Random -minimum .0001 -maximum .9999)
$b = .9998
$c = 2-(2*$a)
$x = 0
$y = 12.1
$w = (($a*$x)+($c*$x*$x))/(1+($x*$x))
$multiplier = 25
$colorChange = $global:colorsValue
$maxIterations = $global:iterationsValue
$counter = 1
$xCentering = 230
$yCentering = 230
$red =   (Get-Random -minimum 0 -maximum 255)
$green = (Get-Random -minimum 0 -maximum 255)
$blue =  (Get-Random -minimum 0 -maximum 255)
while ($counter -le $maxIterations) { $counter++
if (($counter % $colorChange) -eq 0) {
	$red =   (Get-Random -minimum 0 -maximum 255)
	$green = (Get-Random -minimum 0 -maximum 255)
	$blue =  (Get-Random -minimum 0 -maximum 255)
}
$xPixel = ($x * $multiplier) + $xCentering
$yPixel = ($y * $multiplier) + $yCentering
if ($xPixel -ge 0) { 
	if ($yPixel -ge 0) { 
		if ($xPixel -le 511) {   
			if ($yPixel -le 511) { 
				$bitmap.SetPixel($xPixel, $yPixel, [System.Drawing.Color]::FromArgb($red, $green, $blue))
			}
		}
	}
}
$z = $x
$x = ($b*$y)+$w
$u = $x*$x
$w = ($a*$x)+($c*$u)/(1+$u)
$y = $w-$z
}
$naming = (Get-Random -minimum 1000 -maximum 20000)
$bitmap.Save(".\$naming.png", "png")
$bitmap.Dispose()
$bitmapGraphics.Dispose()
}
For($i=0;$i -le 10; $i++){
    generateRanBMP
    }