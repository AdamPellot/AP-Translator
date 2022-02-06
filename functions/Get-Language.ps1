function Get-Language{
    <#
        .SYNOPSIS
            Detects the language of a string.
        .DESCRIPTION
            Detects the language of a string using the Microsoft Translator API. This function relies on a 
            preconfigured stored credential to retrieve the api key. To create the preconfigured stored credential, 
            ensure the CredentialManager module is installed and run the following command:

            New-StoredCredential -Target Translator -UserName Translator -Password <Api Key> -Persist LOCAL_MACHINE

            For more information on the Microsoft Translator API visit:
            https://docs.microsoft.com/en-us/azure/cognitive-services/translator/
        .PARAMETER Text
            The function will try to detect the language of this string.
        .EXAMPLE
            Get-Language "Me gusta comer helado"   

            Spanish
        .NOTES
            Author: Adam Pellot
            Github: https://github.com/AdamPellot
    #>  
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Text 
    ) # end param

    # Retrieve API Key from preconfigured stored credential
    $Cred = Get-StoredCredential -Target "Translator"
    $APIKey = $Cred.GetNetworkCredential().password

    # Set up REST parameters
    $Body = @{"text" = "$Text"} | ConvertTo-Json
    $RestParams = @{
        Uri = "https://api.cognitive.microsofttranslator.com/detect?api-version=3.0"
        Method = "POST"
        Headers = @{
            "Ocp-Apim-Subscription-Key" = $APIKey 
            "Content-type" = "application/json"
        }
        Body = "[$Body]"
    }

    # Get the hash table of supported languages
    $SupportedLanguages = Get-SupportedLanguages -ReturnHash

    # Detect the language of the text
    try {
        $Response = Invoke-RestMethod @RestParams

        # Use the supported languages hash table to map the language code to the full language name
        $SupportedLanguages[$Response.language]
    } catch {
        Write-Error $_.Exception.Message
    } # end try catch
}
