This script uses 5 examples of RestMethod to get data from a webpage. Specifically the latest version of 5 softwares.

-The first deals with json parsing - powershell automatically converts json into an object so the value can be called directly.
-The second deals with parsing raw html for a value between two points on a string - example "The dog is cool." This method could be used to return anything between "The" and "cool."
-The third method deals with parsing a yml file.
-The forth method deals with parsing a raw md page on github
-The fifth method deals with parsing an xml file.

Once data has been parsed it is added to a hash table the saved as a json file in the directory the script was ran. The json is encoded so it can be uploaded to github without any character issues.