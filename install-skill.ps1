$ErrorActionPreference = "Stop"
$source = $PSScriptRoot
$target = Join-Path $env:USERPROFILE ".codex\skills\pcb-revision-release"

if (Test-Path -LiteralPath $target) {
    throw "目标技能目录已存在：$target。为避免覆盖，请先确认后再处理。"
}

New-Item -ItemType Directory -Path $target -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $source "SKILL.md") -Destination (Join-Path $target "SKILL.md")
Copy-Item -LiteralPath (Join-Path $source "README.md") -Destination (Join-Path $target "README.md")

Write-Host "已安装到：$target"
Write-Host "请重新打开 Codex 或开始下一轮对话，使技能被重新发现。"
