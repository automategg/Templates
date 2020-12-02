<#  
.SYNOPSIS 
    Summary of the purpose of the script.

.DESCRIPTION 
    Long form purpose of the script. 

.NOTES 
    File Name       :   Show-HeaderTemplate.ps1
    Author          :   Automate.gg
    Prerequisite    :   PowerShell V4, module, .NET libraries, etc.
    Version         :   2.01

    -v 1.0  (2020 11 29) : Initial version
    -v 1.1  (2020 11 30) : Minor update
    -v 2.0  (2020 12 01) : Major update
    -v 2.01 (2020 12 02) : Very minor update

.PARAMETER switchParameter
    Describe what the switch will do.

.PARAMETER inputParamter
    Describe what is an acceptable input and what it will do. 

.PARAMETER stringParameter
    Describe what is an acceptable input and what it will do. 

.PARAMETER parameter
    Include as many paramters as necessary. 

.EXAMPLE
    Show-HeaderTemplate 
    
    The most simple execution.

.EXAMPLE
    Show-HeaderTemplate -switchParameter
    
    MANDATORY

    Execution with a parameter. Describe what occurs when using this parameter

.EXAMPLE
    Show-HeaderTemplate -inputParameter Value
    
    Execution with a parameter. Describe what occurs when using this parameter

.EXAMPLE
    Show-HeaderTemplate -enforcedStringParameter:someValue
    
    Execution with a parameter. Describe what occurs when using this parameter

.EXAMPLE
    Include as many examples as necessary.

.LINK
    https://www.automate.gg/

#>

Param(
        [Parameter(Mandatory=$true)]
            [switch]$switchParameter,
        [Parameter(Mandatory=$false)]
            $inputParamter,
        [Parameter(Mandatory=$false)]
            [ValidateSet('someValue',
                'anotherValue',
                'oneMoreValue')]
            [string[]]
            $enforcedStringParameter
        )