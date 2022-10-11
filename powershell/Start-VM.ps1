
$ScriptsDir  = "D:\Applications\utilities\powershell";
$ScriptName = "Start-VM"
$LogPath = "$ScriptsDir\logs";
$LogFile = "$LogPath\$ScriptName $(Get-DateForLog).log";
$rc = -1;

Import-Module -Name "$ScriptsDir\MyFunctions" -Force -Verbose

$VMrunExe = "D:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe"
$VMPath = "V:\Docker\"
$VMName = "Docker.vmx"

Write-Log $LogFile "$(Get-CustomDate) [DEB] Demarrage de la VM "

& $VMrunExe -T ws start "$VMPath$VMName" nogui
 
$rc = $LASTEXITCODE;

Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"

if( $rc -eq 0 ) {
	
	Write-Log $LogFile "$(Get-CustomDate) [OK]  Demarrage de la VM"
	
} else {

	Write-Log $LogFile "$(Get-CustomDate) [KO]  Demarrage de la VM"

    throw $rc
}


Write-Log $LogFile "$(Get-CustomDate) [FIN] Demarrage de la VM"

Exit $rc

