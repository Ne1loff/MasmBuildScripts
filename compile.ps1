param([string] $pathToFile=$(throw "Please specify a path to file (.asm)"))

Write-Output "Start compiling..."

$work_dir = "C:\masm32"
$include_path = $work_dir + "\incldue";

$current_path = Get-Location
$was_cd = $false

if ($work_dir -ne $current_path) {
    Set-Location -Path $work_dir
    $was_cd = $true
}

C:\masm32\bin\ML.EXE /c /coff /Cp /nologo /I"$include_path" "$pathToFile"
$destination = Split-Path -parent $pathToFile
$obj = Get-Item ("./" + [System.IO.Path]::GetFileNameWithoutExtension($pathToFile) + ".obj")
Move-Item -Force -Path $obj -Destination $destination

if ($was_cd) {
    Set-Location -Path $current_path
}

Write-Output "Compiling successfully done!"