$ErrorActionPreference = 'Stop'

$source = $PSScriptRoot
$target = Join-Path -Path $env:USERPROFILE -ChildPath '.codex\skills\pcb-revision-release'

if (Test-Path -LiteralPath $target) {
    throw ('Target skill directory already exists: ' + $target)
}

New-Item -ItemType Directory -Path $target -Force | Out-Null

$skillSource = Join-Path -Path $source -ChildPath 'SKILL.md'
$readmeSource = Join-Path -Path $source -ChildPath 'README.md'
$skillTarget = Join-Path -Path $target -ChildPath 'SKILL.md'
$readmeTarget = Join-Path -Path $target -ChildPath 'README.md'

Copy-Item -LiteralPath $skillSource -Destination $skillTarget
Copy-Item -LiteralPath $readmeSource -Destination $readmeTarget

Write-Host ('Installed skill to: ' + $target)
Write-Host 'Restart Codex or start a new conversation to reload skills.'
