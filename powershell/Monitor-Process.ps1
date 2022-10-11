
param (
    [Parameter(Mandatory=$true)]$target
 )


$process = Get-Process | Where-Object {$_.ProcessName -eq $target}


while ($true)
{
    while (!($process))
    {
        $process = Get-Process | Where-Object {$_.ProcessName -eq $target}

        Write-Output "Process inexistant ou terminé"

        start-sleep -s 5
    }

    if ($process)
    {
        #"Place action on process start here"

        $processStartTime = $process.StartTime

        $output = Get-WmiObject -Query "select * from win32_process where name='$target.exe'" |
                  Format-List -Property Name, CreationDate, Name, ProcessID, StartMode, State, Status, CommandLine
                  #Format-List -Property *

        $process.WaitForExit()

        $ExecTime = New-TimeSpan -Start $processStartTime

        Write-Output $ExecTime

        Write-Output $output

        #start-sleep -s 2

        #$process = Get-Process | Where-Object {$_.ProcessName -eq $target}

        

        

        #"Place action on process exit here"

    }

    Exit -1
}