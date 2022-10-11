
$ExDir = "E:\";
$ScriptsDir = "$ExDir\Scripts"
$ScriptName = "Copy-Data";
$rc = -1;

Import-Module -Name "$ScriptsDir\MyFunctions" -Force -Verbose
#Get-Command -Module "C:\Users\anass\Google Drive\10 - S.I. Maison\Scripts\MyFunctions" -Force


$LogPath = "$ExDir\Logs";
$LogFile = "$LogPath\$ScriptName $(Get-DateForLog).log";


$FolderPath= "\\alfresco.olympus\volumes";

$DestinationPath = "R:\Alfresco\Backups\PPR";

Write-Log $LogFile "$(Get-CustomDate) [DEB] Copie des donnees PPR de Alfresco vers le disque R:/  "


$SourcePath = "$FolderPath\alf-repo-data_ppr";
$rc = Copy-Custom -SourcePath $SourcePath -DestinationPath $DestinationPath -LogFile $LogFile
Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"


$SourcePath = "$FolderPath\solr-data_ppr";
$rc = Copy-Custom -SourcePath $SourcePath -DestinationPath $DestinationPath -LogFile $LogFile
Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"



$SourcePath = "$FolderPath\postgres-data_ppr"; 
$rc = Copy-Custom -SourcePath $SourcePath -DestinationPath $DestinationPath -LogFile $LogFile
Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"


Write-Log $LogFile "$(Get-CustomDate) [FIN] Copie des donnees PPR de Alfresco vers le disque R:/  "


$DestinationPath = "R:\Alfresco\Backups\PROD";


Write-Log $LogFile "$(Get-CustomDate) [DEB] Copie des donnees PROD de Alfresco vers le disque R:/  "


$SourcePath= "$FolderPath\alf-repo-data"; 
$rc = Copy-Custom -SourcePath $SourcePath -DestinationPath $DestinationPath -LogFile $LogFile
Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"

$SourcePath = "$FolderPath\solr-data";
$rc = Copy-Custom -SourcePath $SourcePath -DestinationPath $DestinationPath -LogFile $LogFile
Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"


$SourcePath = "$FolderPath\postgres-data"; 
$rc = Copy-Custom -SourcePath $SourcePath -DestinationPath $DestinationPath -LogFile $LogFile
Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"



Write-Log $LogFile "$(Get-CustomDate) [FIN] Copie des donnees PROD de Alfresco vers le disque R:/  "

Exit $rc