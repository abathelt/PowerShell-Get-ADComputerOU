$Domain_List = Get-Content "C:\temp\domains.txt"
$ComputerName_List = Get-Content "C:\temp\computers.txt"

foreach ($Domain in $Domain_List){ 
foreach ($ComputerName in $ComputerName_List){ 
 
$ErrorActionPreference = "Stop" 
 try{ 


Get-ADComputer -Server "$Domain" -Identity "$ComputerName" -Properties OperatingSystem
#DistinguishedName
    if (Test-Connection -ComputerName "$ComputerName" -Count 1 -Quiet) {
        "$targetComputer - Ping OK"
        ""
    } else {
        "$targetComputer - Ping FAIL"
        ""
    }

    }

 catch{
    #write-host "$ComputerName do not exist in this domain" -ForegroundColor red
    }

     } 
}

Write-Host "Script Completed" -ForegroundColor green -ErrorAction Stop 
