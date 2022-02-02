# Get the path of the function files
$FunctionPath = $PSScriptRoot + "\functions\"

# Get the file names of all the functions
$Functions = Get-ChildItem -Path $FunctionPath -Name

# Dot source all of the functions
foreach ($Function in $Functions)
{
    . ($FunctionPath + $Function)
}