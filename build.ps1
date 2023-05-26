param([string] $pathToFile=$(throw "Please specify a path to file (.asm)"), [string] $subsystem=$("CONSOLE"))

Write-Output "Start building..."

$work_dir = "C:\masm32"

$current_path = Get-Location
$was_cd = $false
if ($work_dir -ne $current_path) {
    Set-Location -Path $work_dir
    $was_cd = $true
}

./compile.ps1 $pathToFile
$destination = Split-Path -parent $pathToFile
$pathToFile = $destination + "/" + [System.IO.Path]::GetFileNameWithoutExtension($pathToFile) + ".obj";
./link.ps1 $pathToFile

if ($was_cd) {
    Set-Location -Path $current_path
}

Write-Output "Build successfully done!"

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU0AzWFKaSDSjdRoNaU1jO7m4V
# jTKgggMiMIIDHjCCAgagAwIBAgIQdUFtsASN44NBPZWMSapPmTANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUpbN5uDzpHhTG2igrJ8Fs
# RVJ4LswwDQYJKoZIhvcNAQEBBQAEggEAVSL0jA0ywcsiI78yzzZB/sy2z41Od7+a
# dUxdsF5fL6GppR+UrzVVC7X+FsYuSuxR7u9M2ubQ5AkS9Uz+7b+PDeOxDE142lib
# ac8ed8sgB3s0nPs1IXRrO66c45s/vlnzrJx8t3oPQ4c2+JqP8kAUKhx9nWTExkjv
# c+0wnxYtCnvINlgaVJZIg4ACD6dcSxlzuxS7yXZI9B85pyZZ/mCpgVz/qZWi7yJu
# LKu6pMxKRwpEzI/psllDXrBTZwqjTFGrAeVpaMNGELlqXrdaue1V17gMwmrM0f81
# OE/gtc5TDRacU/sXvY8Iw9aMjYvs4qT+pBy14rNy5TvdB8SV8mzJag==
# SIG # End signature block
