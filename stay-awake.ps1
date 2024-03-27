Function Stay-Awake{
    [CmdletBinding()]
        param (	
            [Parameter (Position=0, Mandatory = $True)]
            [Int]$Seconds=10
        )
         
    Add-Type -AssemblyName System.Windows.Forms
    $o=New-Object -ComObject WScript.Shell
    While(1){
        
        $originalPOS = [System.Windows.Forms.Cursor]::Position.X
        Foreach($count in 1..$Seconds){
            Write-Progress -Activity "Waiting" -Status "Wait for check mouse status" -SecondsRemaining ($seconds-$count) -PercentComplete ($count/$Seconds*100)
            Start-Sleep -Seconds 1
        }
        Write-Host "$(Get-Date -Format "HH:mm:ss")" -ForegroundColor Green -NoNewline 
        Write-Host "`t => " -NoNewline -ForegroundColor Cyan
        if ([Windows.Forms.Cursor]::Position.X -eq $originalPOS){
            $o.sendkeys("{SCROLLLOCK 2}")
            Write-Host "SEND ScrollLock"            
        }else{
            Write-Host "User is working"
        }

    } 
}

Stay-Awake -Seconds 60