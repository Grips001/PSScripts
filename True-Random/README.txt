True-Random uses NOAA ocean buoy wave height data to seed a random number between two values set by the user.

To use:

Either Import-Module the psm1 file
-or
Copy the function into your script.

To call:

True-Random 1 10

Will generate a random number between 1 and 10.

The key difference between this function and say Get-Random is; the script nor the user has "ominscient perspective" meaning the output would be near impossible to predict due to the number of permutations equaling 2.759537246 E+121287.