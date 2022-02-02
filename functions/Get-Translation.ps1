function Get-Translation{
    <#
        .SYNOPSIS
            Translates a string from one language to another.
        .DESCRIPTION
            Returns a translation of a string based on the given "From Language" and "To Language" using the Microsoft Translator API.
            This function relies on a preconfigured stored credential to retrieve the api key. The CredentialManager module is needed 
            to create the preconfigured stored credential.

            For more information on the Microsoft Translator API visit https://docs.microsoft.com/en-us/azure/cognitive-services/translator/

            For a list of supported language codes visit https://docs.microsoft.com/en-us/azure/cognitive-services/translator/language-support 
        .PARAMETER Text
            This parameter is the string that will be translated.
        .PARAMETER FromLanguage
            This parameter is the two-character language code of the language the text will be translated to.
        .PARAMETER ToLanguage  
            This parameter is the two-character language code of the language the text will be translated from.
        .EXAMPLE
            PS C:\> Get-Translation -FromLanguage en -ToLanguage es -Text "The cake is a lie"

            El pastel es mentira
        .EXAMPLE
            PS C:\Users\Adam> Get-Translation

            cmdlet Get-Translation at command pipeline position 1
            Supply values for the following parameters:
            Text: Yesterday, all my troubles seemed so far away
            ToLanguage: fr
            Hier, tous mes ennuis semblaient si loin
        .EXAMPLE
            PS C:\Users\Adam> Get-Translation -from es -to en -text "Feliz navidad"  

            Merry Christmas
        .NOTES
            Author: Adam Pellot
            Github: https://github.com/AdamPellot
    #>  
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Text,
        [Parameter(Mandatory = $false)]
        [Alias('From')]
        [string]
        $FromLanguage,
        [Parameter(Mandatory = $true)]
        [Alias('To')]
        [string]
        $ToLanguage
    )
    process{
        # Retrieve API Key from preconfigured stored credential
        $Cred = Get-StoredCredential -Target 'Translator'
        $APIKey = $Cred.GetNetworkCredential().password

        $BaseUri = 'https://api.cognitive.microsofttranslator.com/translate?api-version=3.0'

        $Location = 'global'

        $Body = @{'text' = $Text} | ConvertTo-Json

        $RestParams = @{
            Uri = $BaseUri + "&from=$FromLanguage&to=$ToLanguage"
            Method = "POST"
            Headers = @{
                'Ocp-Apim-Subscription-Key' = $APIKey 
                'Ocp-Apim-Subscription-Region' = $Location
                'Content-type' = 'application/json'
            }
            Body = "[$Body]"
        }

        try {
            $Response = Invoke-RestMethod @RestParams
            $Response.translations.text
        } catch [System.Net.WebException]{
            $Error[0].ErrorDetails.Message | ConvertFrom-Json
        } # end try catch
    }
}