---
external help file: AP-Translator-help.xml
Module Name: AP-Translator
online version:
schema: 2.0.0
---

# Get-Language

## SYNOPSIS
Detects the language of a string.

## SYNTAX

```
Get-Language [-Text] <String> [<CommonParameters>]
```

## DESCRIPTION
Detects the language of a string using the Microsoft Translator API.
This function relies on a 
preconfigured stored credential to retrieve the api key.
To create the preconfigured stored credential, 
ensure the CredentialManager module is installed and run the following command:

New-StoredCredential -Target Translator -UserName Translator -Password \<Api Key\> -Persist LOCAL_MACHINE

For more information on the Microsoft Translator API visit:
https://docs.microsoft.com/en-us/azure/cognitive-services/translator/

## EXAMPLES

### EXAMPLE 1
```
Get-Language "Me gusta comer helado"
```

Spanish

## PARAMETERS

### -Text
The function will try to detect the language of this string.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
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
