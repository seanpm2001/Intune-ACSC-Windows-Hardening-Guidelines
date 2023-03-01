<#
.COPYRIGHT
Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license.
See LICENSE in the project root for license information.
#>

Function WriteReg {
    param (
        [Parameter(Mandatory = $true)]
        [string]$registryPath
    )

    If(!(Test-Path $registryPath)) {
      New-Item -Path $registryPath -Force | Out-Null
    }

    New-ItemProperty -Path $registryPath -Name EveryoneIncludesAnonymous -Value 0 -PropertyType DWORD -Force | Out-Null

}

WriteReg("HKLM:\System\CurrentControlSet\Control\Lsa")