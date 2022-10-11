
function Get-CustomDate {
	
	$date = Get-Date -Format "dd/MM/yyyy HH:mm:ss"
	
	return $date
}

function Get-DateForLog {
	
	$date = Get-Date -Format "yyyyMMdd_HHmmss"
	
	return $date
}

function Copy-Custom {
	
		param (
			[string]$SourcePath,
			[string]$DestinationPath,
			[string]$LogFile
		)
	
		Write-Log $LogFile "$(Get-CustomDate) [DEB] Copie de $(SourcePath) vers $(DestinationPath) "
		
		Copy-Item -Path $SourcePath -Destination $DestinationPath -Recurse -Force -Verbose
		
		$rc = $LASTEXITCODE;

		Write-Log $LogFile "$(Get-CustomDate) [RC]  RC=$rc"
		
		if( $rc -eq 0 ) {
	
			Write-Log $LogFile "$(Get-CustomDate) [OK]  Copie de $(SourcePath) vers $(DestinationPath) terminé sans erreurs  "
	
	
		} else {

			
			Write-Log $LogFile "$(Get-CustomDate) [KO]  Copie de $(SourcePath) vers $(DestinationPath) terminé avec erreurs  "

            throw $rc
		}
		
		Write-Log $LogFile "$(Get-CustomDate) [FIN] Copie de $(SourcePath) vers $(DestinationPath)  "
		
		Exit $rc
		
}

function Write-Log {
    param(
		[Parameter(Mandatory=$true)][String]$file,
        [Parameter(Mandatory=$true)][String]$msg
    )
    
    Add-Content $file $msg
}


Export-ModuleMember -Function Copy-Custom
Export-ModuleMember -Function Get-CustomDate
Export-ModuleMember -Function Get-DateForLog
Export-ModuleMember -Function Write-Log 
