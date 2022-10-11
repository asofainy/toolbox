
$ExDir = "E:\";
$ScriptsDir = "$ExDir\Scripts"
$ScriptName = "Start-Backup"
$rc = -1;

Import-Module -Name "$ScriptsDir\MyFunctions" -Force -Verbose
#Get-Command -Module "C:\Users\anass\Google Drive\10 - S.I. Maison\Scripts\MyFunctions" -Force


$LogPath = "$ExDir\Logs";
$LogFile = "$LogPath\$ScriptName $(Get-DateForLog).log";

$Msg = "de la sauvegarde"
$BackupTarget="c:"
$BackupDir = "$ExDir\Backups"
$BackupDate = "06:00"


Write-Log $LogFile "$(Get-CustomDate) [DEB] Debut $Msg "

#& wbadmin enable backup -addTarget:$BackupTarget -include:$BackupDir -schedule:$BackupDate

& wbadmin start backup –backupTarget:$BackupTarget -include:$BackupDir
 
$rc = $LASTEXITCODE;

Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"

if( $rc -eq 0 ) {
	
	Write-Log $LogFile "$(Get-CustomDate) [OK]  Succes $Msg"
	
} else {

	Write-Log $LogFile "$(Get-CustomDate) [KO]  Echec $Msg"

    throw $rc
}


Write-Log $LogFile "$(Get-CustomDate) [FIN] Fin $Msg"

Exit $rc

