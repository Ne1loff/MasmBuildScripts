param([string] $pathToFile=$(throw "Please specify a path to file (.obj)"), [string] $subsystem=$("CONSOLE"))

Write-Output "Start linking..."

$work_dir = "C:\masm32"
$bin_path = $work_dir + "\bin"
$lib_path = $work_dir + "\lib";

$current_path = Get-Location
$was_cd = $false
if ($work_dir -ne $current_path) {
    Set-Location -Path $work_dir
    $was_cd = $true
}

if ($subsystem -eq "CONSOLE") {
    & $bin_path\LINK.EXE /SUBSYSTEM:CONSOLE /RELEASE /VERSION:4.0 /LIBPATH:"$lib_path" "$pathToFile"
} elseif ($subsystem -eq "WINDOW") {
    & $bin_path\LINK.EXE /SUBSYSTEM:WINDOW /RELEASE /VERSION:4.0 /LIBPATH:"$lib_path" "$pathToFile"
} else {
    throw "Only CONSOLE, WINDOW is allowed for SUBSYSTEM flag"
}

$destination = Split-Path -parent $pathToFile
$obj = Get-Item ("./" + [System.IO.Path]::GetFileNameWithoutExtension($pathToFile) + ".exe")
Move-Item -Force -Path $obj -Destination $destination

if ($was_cd) {
    Set-Location -Path $current_path
}

Write-Output "Linking successfully done!"

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUyD5YNgMPhFyQb0xf0JBMtWGi
# PXigggMiMIIDHjCCAgagAwIBAgIQdUFtsASN44NBPZWMSapPmTANBgkqhkiG9w0B
# AQsFADAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MB4X
# DTIzMDUyNTIwNTE1N1oXDTI0MDUyNTIxMTE1N1owJzElMCMGA1UEAwwcUG93ZXJT
# aGVsbCBDb2RlIFNpZ25pbmcgQ2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBALT2/drMlA0bS7FjOV5lhlvPcLsOFHSZA/0NLQwLkkMw1WUzb/rb7mbc
# L+Vl4KRBfyJFf06eBM0gti0NTN2t2VGbBu9EpUd17NwymqB6o17EdGOqEdASWwn5
# R3SJ4pLCbK+InZqebjexK1QhG6b7s5pB8/3Ca6s/E8g0RXQXWlPy49LM3Ek30hOa
# BgCfG8KDlSIF9PmrgP4xXtwZtUzwxR3qYKdKXXI6KnzQvl+DeCe/lmdWODBQrIKH
# zGQTUpkPCuxZLJN6pe9lVtBpFc+Baw7lchxHTqoiuNn/+i0UlxBYcf6qXYFv0B+y
# FSEDbt3dE8HEGZuDEmpyb4ekRGuTnJ0CAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBS6svooamfFzA81Szk/dXa9
# N0xSvzANBgkqhkiG9w0BAQsFAAOCAQEAnnxUq+H3Vrvxdj7/p3FmjJAI0y2KMsEv
# lrliSrv4N/UlUc37NZmCihpOMX3Z/j/md6MaROLFvwvNSKWp6xracNQ2A2JonOKf
# 7f3Dz/FLvh4FZvDAwk63thOOHrkq2/tsMEzos1Lvuz+qtS8wIme+Xadg9Cf3vE5+
# RkOxZtKZCnGXWYJvLsDKeJoYYGrReMgXtXqkuofUdhh96eqfO6OkOBNiDbwdeWFY
# rIzUB4Zf7vRHbAj9rofSM6XWuPAfyjpzWwcOdjoA9ML1JDah71ahcGSxCn/Ge9Lp
# V4utdcx0xflgH7ziZfLf+15Cw9B6yWZbQnYkb7k8sDDHv3JahE2tdjGCAdwwggHY
# AgEBMDswJzElMCMGA1UEAwwcUG93ZXJTaGVsbCBDb2RlIFNpZ25pbmcgQ2VydAIQ
# dUFtsASN44NBPZWMSapPmTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUdjiNqfdYqGOV3knhiVB9
# +KNJpxowDQYJKoZIhvcNAQEBBQAEggEAsEz/u0IZz/dvNM/iayVqOhzI2rSq3Fhb
# mWLA/kSZipc8J7yDp7yGh0BA+8oF/Xvb4cet78BgmAgwVaLyOiujhMgDcYiNVOmL
# LiF1f2hwVQp7XmlWJV3CjptLLEOpksHYENGaWRl0FTpd27psgIPRDGr7n9vY5LVD
# O8HXan1vc29DHSycltZ+TxTgvYODGx5iqAsPlFc9yCJQ8SczfwyoEVoW8fcL5F99
# SDZ8LwHQZK3NZc9HJwITR5fDRkI4ZmSuIvw8QEXgsGCvDyuKVE8uvOdMD2kxhk6m
# mxY2PI1M3VZiAB65yqVsQviJGKvZuEVr2UxNhSZd0O6rgmQARCXrEA==
# SIG # End signature block
