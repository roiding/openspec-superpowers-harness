param(
    [string]$DestinationPath = "$env:USERPROFILE\.codex\skills",
    [string[]]$Companions = @(),
    [ValidateSet("Junction", "Copy")]
    [string]$Mode = "Junction",
    [switch]$Force
)

$ErrorActionPreference = "Stop"

function Ensure-Directory {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function Remove-ExistingTarget {
    param([string]$Path)
    if (Test-Path -LiteralPath $Path) {
        if (-not $Force) {
            throw "Target already exists: $Path. Re-run with -Force to replace it."
        }
        Remove-Item -LiteralPath $Path -Recurse -Force
    }
}

function Install-SkillFolder {
    param(
        [string]$SourcePath,
        [string]$TargetPath,
        [string]$InstallMode
    )

    Remove-ExistingTarget -Path $TargetPath

    if ($InstallMode -eq "Copy") {
        Copy-Item -LiteralPath $SourcePath -Destination $TargetPath -Recurse
        Write-Host "Copied: $TargetPath"
        return
    }

    $parent = Split-Path -Parent $TargetPath
    Ensure-Directory -Path $parent
    cmd /c mklink /J "$TargetPath" "$SourcePath" | Out-Null
    Write-Host "Junction created: $TargetPath -> $SourcePath"
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$mainSkillName = Split-Path -Leaf $repoRoot
$mainTarget = Join-Path $DestinationPath $mainSkillName

Ensure-Directory -Path $DestinationPath

$normalizedRepoRoot = [System.IO.Path]::GetFullPath($repoRoot)
$normalizedMainTarget = [System.IO.Path]::GetFullPath($mainTarget)

if ($normalizedRepoRoot -ieq $normalizedMainTarget) {
    Write-Host "Main skill already lives at destination: $mainTarget"
} else {
    Install-SkillFolder -SourcePath $repoRoot -TargetPath $mainTarget -InstallMode $Mode
}

$companionRoot = Join-Path $repoRoot "companion-skills"

foreach ($name in $Companions) {
    $source = Join-Path $companionRoot $name
    if (-not (Test-Path -LiteralPath $source)) {
        throw "Companion skill not found: $name"
    }

    $target = Join-Path $DestinationPath $name
    Install-SkillFolder -SourcePath $source -TargetPath $target -InstallMode $Mode
}

Write-Host ""
Write-Host "Installation complete."
Write-Host "Destination: $DestinationPath"
Write-Host "Main skill: $mainSkillName"
if ($Companions.Count -gt 0) {
    Write-Host "Companions: $($Companions -join ', ')"
} else {
    Write-Host "Companions: none"
}
