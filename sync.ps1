param(
    [string]$Message = "Update PCB design skill"
)

$git = "C:\Users\JF\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\git\cmd\git.exe"
$repo = $PSScriptRoot

if (-not (Test-Path -LiteralPath $git)) {
    throw "Git executable not found: $git"
}

# 仅配置当前仓库，避免受限环境无法写入用户级 .gitconfig。
& $git -C $repo config --local --add safe.directory ($repo -replace '\\','/')
& $git -C $repo config --local credential.helper manager
& $git -C $repo add SKILL.md README.md sync.ps1
$changes = (& $git -C $repo status --porcelain)
if ($changes) {
    & $git -C $repo commit -m $Message
    if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

& $git -C $repo push
exit $LASTEXITCODE
