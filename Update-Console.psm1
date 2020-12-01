<#  
.SYNOPSIS  
    Console output with settings to change the font color and add a timestamp.

.DESCRIPTION  
    Console output with settings to change the font color and add a timestamp.

    Output with a font color is great at presenting status or unexpected values. 
    Using Gray for requests, info or benign status, using white for system 
    status or higher status, using green for success or completed, using yellow 
    and red for try, catch blocks, or using blue for highlightable actions.

    Output with a timestamp works very well for console monitoring actions being 
    performed by the script. Timestamping works even better when using 
    transcripts or other logging functionality to troubleshoot issues or to 
    audit tasks.

.NOTES  
    File Name       :   Update-Console.psm1
    Author          :   Automate.gg
    Prerequisite    :   PowerShell V4
    Version         :   1.1

    -v 1.0  (2020 11 30) : Initial version
    -v 1.01 (2020 11 30) : Updated to support 80 char line length
    -v 1.1  (2020 12 01) : Included log parameter

.EXAMPLE
    Update-Console “Could you describe this ruckus, sir?”

    Console output is default font color.

.EXAMPLE
    Update-Console -colorTemp:Yellow "My uncle was microwaving our socks and the 
        dog threw up on the couch for an hour."

    Console output is Yellow font color.

    You do not need to know the available font colors, you can TAB cycle through 
        them.

.EXAMPLE
    Update-Console -timeStamp -colorTemp:DarkGreen “You call that pitching? This 
        is baseball! Not tennis!"

    Console output starts with the current timestamp and the entire line is Dark 
        Green font color.

    You do not need to know the available font colors, you can TAB cycle through 
        them.

.EXAMPLE
    Update-Console -timeStamp -colorTemp:Red -log "Greetings, programs!"

    Console output starts with the current timestamp and the entire line is Red 
        font color. Output statement is logged for auditing or troubleshooting
    
#>
    
function Update-Console {
<#----------------------
    Updates the Console window
-----------------------#>

    Param(
        [Parameter(Mandatory=$true)]
            $consoleOutput,
        [Parameter(Mandatory=$false)]
            [switch]$timeStamp,
        [Parameter(Mandatory=$false)]
            [switch]$log,
        [Parameter(Mandatory=$false)]
            [ValidateSet('Black',
                'DarkBlue',
                'DarkCyan',
                'DarkGray',
                'DarkGreen',
                'DarkMagenta',
                'DarkRed',
                'DarkYellow',
                'Blue',
                'Cyan',
                'Gray',
                'Green',
                'Magenta',
                'Red',
                'Yellow',
                'White')]
            [string[]]
            $colorTemp
        )
    
    $colorOriginal = "White"

    If ($colorTemp){
        $host.ui.RawUI.ForegroundColor = $colorTemp
    }

    If ($timeStamp) {
        Write-Host ([string](Get-Date -displayhint Time) + "`t" + $consoleOutput)

    }
    else {
        Write-Host ($consoleOutput)
    }

    If ($log) {
        # Log statement
        #Update-Log
    }

    $host.ui.RawUI.ForegroundColor = $colorOriginal    
}

Export-ModuleMember -Function Update-Console