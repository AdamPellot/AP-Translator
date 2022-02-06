---
external help file: AP-Translator-help.xml
Module Name: AP-Translator
online version:
schema: 2.0.0
---

# Get-SupportedLanguages

## SYNOPSIS
Gets all supported languages.

## SYNTAX

```
Get-SupportedLanguages [-ReturnHash] [<CommonParameters>]
```

## DESCRIPTION
Gets all supported languages and codes for the Microsoft Translator API.
This function relies on a 
preconfigured stored credential to retrieve the api key.
To create the preconfigured stored credential, 
ensure the CredentialManager module is installed and run the following command:

```
New-StoredCredential -Target Translator -UserName Translator -Password \<Api Key\> -Persist LOCAL_MACHINE
```

For more information on the Microsoft Translator API visit:
https://docs.microsoft.com/en-us/azure/cognitive-services/translator/

## EXAMPLES

### EXAMPLE 1
```
Get-SupportedLanguages

Language                Abbreviation
--------                ------------
Afrikaans               af
Albanian                sq
Amharic                 am
Arabic                  ar
Armenian                hy
```

### EXAMPLE 2
```
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
```
## PARAMETERS

### -ReturnHash
If this parameter is included, a hash table will be returned.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Adam Pellot
Github: https://github.com/AdamPellot

## RELATED LINKS
