function Get-SupportedLanguages{
    <#
        .SYNOPSIS
            Gets all supported languages.
        .DESCRIPTION
            Gets all supported languages and codes for the Microsoft Translator API. This function relies on a 
            preconfigured stored credential to retrieve the api key. To create the preconfigured stored credential, 
            ensure the CredentialManager module is installed and run the following command:

            New-StoredCredential -Target Translator -UserName Translator -Password <Api Key> -Persist LOCAL_MACHINE

            For more information on the Microsoft Translator API visit:
            https://docs.microsoft.com/en-us/azure/cognitive-services/translator/
        .PARAMETER ReturnHash
            If this parameter is included, a hash table will be returned.
        .EXAMPLE
            Get-SupportedLanguages

            Language                Abbreviation
            --------                ------------
            Afrikaans               af
            Albanian                sq
            Amharic                 am
            Arabic                  ar
            Armenian                hy
            
        .EXAMPLE
            Get-SupportedLanguages -ReturnHash

            Name                           Value
            ----                           -----
            ht                             Haitian Creole
            sv                             Swedish
            gu                             Gujarati
            ko                             Korean
            km                             Khmer
            my                             Myanmar (Burmese)
            uz                             Uzbek (Latin)
            ps                             Pashto

        .NOTES
            Author: Adam Pellot
            Github: https://github.com/AdamPellot
    #> 
    [CmdletBinding()]
    param(
        [switch]$ReturnHash
    ) # end param

    # Retrieve API Key from preconfigured stored credential
    $Cred = Get-StoredCredential -Target "Translator"
    $APIKey = $Cred.GetNetworkCredential().password

    # Set up REST parameters
    $RestParams = @{
        Uri = "https://api.cognitive.microsofttranslator.com/languages?api-version=3.0"
        Method = "GET"
        Headers = @{
            "Ocp-Apim-Subscription-Key" = $APIKey 
            "Content-type" = "application/json"
        }
    }

    # Add the supported languages to an array of objects and to a hash table
    try {
        $Response = Invoke-RestMethod @RestParams

        $SupportedLanguages = @()
        $SupportedLanguagesHash = @{}
        foreach ($Language in $Response.translation.psobject.properties){
            $CurrentLanguage = $Language.name

            $LanguageInfo = [PSCustomObject]@{
                Language = $Response.translation.$CurrentLanguage.name
                LanguageCode = $CurrentLanguage
            }

            $SupportedLanguages += $LanguageInfo
            $SupportedLanguagesHash[$CurrentLanguage] = $Response.translation.$CurrentLanguage.name
        } # end foreach

        # Return supported languages as a hashtable or object based on $ReturnHash parameter
        if ($ReturnHash){
            $SupportedLanguagesHash
        } else {
            $SupportedLanguages | Sort-Object Language
        } # end if
        
    } catch {
        Write-Error $_.Exception.Message
    } # end try catch
}