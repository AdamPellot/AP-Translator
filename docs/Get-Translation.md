---
external help file: AP-Translator-help.xml
Module Name: AP-Translator
online version:
schema: 2.0.0
---

# Get-Translation

## SYNOPSIS
Translates a string from one language to another.

## SYNTAX

```
Get-Translation [-Text] <String> [[-FromLanguage] <String>] [-ToLanguage] <String> [<CommonParameters>]
```

## DESCRIPTION
Returns a translation of a string based on the given "From Language" and "To Language" using the Microsoft Translator API.
This function relies on a preconfigured stored credential to retrieve the api key.
The CredentialManager module is needed 
to create the preconfigured stored credential.

For more information on the Microsoft Translator API visit https://docs.microsoft.com/en-us/azure/cognitive-services/translator/

For a list of supported language codes visit https://docs.microsoft.com/en-us/azure/cognitive-services/translator/language-support

## EXAMPLES

### EXAMPLE 1
```
Get-Translation -FromLanguage en -ToLanguage es -Text "The cake is a lie"
```

El pastel es mentira

### EXAMPLE 2
```
Get-Translation
```

cmdlet Get-Translation at command pipeline position 1
Supply values for the following parameters:
Text: Yesterday, all my troubles seemed so far away
ToLanguage: fr
Hier, tous mes ennuis semblaient si loin

### EXAMPLE 3
```
Get-Translation -from es -to en -text "Feliz navidad"
```

Merry Christmas

## PARAMETERS

### -Text
This parameter is the string that will be translated.

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

### -FromLanguage
This parameter is the two-character language code of the language the text will be translated to.

```yaml
Type: String
Parameter Sets: (All)
Aliases: From

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ToLanguage
This parameter is the two-character language code of the language the text will be translated from.

```yaml
Type: String
Parameter Sets: (All)
Aliases: To

Required: True
Position: 3
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
