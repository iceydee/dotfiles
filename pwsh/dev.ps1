oh-my-posh.exe init pwsh --config "$HOME/my/dotfiles/pwsh/oh-my-posh-config.json" | Invoke-Expression

# pyenv-win configuration for PowerShell
$env:PYENV_ROOT = "$env:USERPROFILE\.pyenv\pyenv-win"
$env:PATH = "$env:PYENV_ROOT\shims;$env:PYENV_ROOT\bin;$env:PATH"

# Initialize pyenv if the script exists
if (Test-Path "$env:PYENV_ROOT\bin\pyenv.ps1") {
    & "$env:PYENV_ROOT\bin\pyenv.ps1"
}

clear

# gprune function
function gprune {
  [CmdletBinding()]
  param()

  # Ensure we're in a git repo
  git rev-parse --is-inside-work-tree *> $null
  if ($LASTEXITCODE -ne 0) {
    Write-Error "Not inside a git repository."
    return
  }

  # Fetch and prune remote-tracking branches
  git fetch -p | Out-Null

  # Local branches (exclude current)
  $local = git branch --format="%(refname:short)" 2>$null |
    Where-Object { $_ -and $_.Trim() -ne "" } |
    Sort-Object

  # Remote branches on origin (strip 'origin/')
  $remote = git branch -r --format="%(refname:short)" 2>$null |
    Where-Object { $_ -like "origin/*" } |
    ForEach-Object { $_.Substring("origin/".Length) } |
    Sort-Object -Unique

  # Compute locals that are not present on origin
  $toDelete = $local | Where-Object { $_ -notin $remote }

  if (-not $toDelete -or $toDelete.Count -eq 0) {
    Write-Host "No local branches to prune."
    return
  }

  Write-Host "Deleting local branches not on origin:"
  $toDelete | ForEach-Object { Write-Host "  $_" }

  foreach ($b in $toDelete) {
    # -D like your bash version (force delete)
    git branch -D $b | Out-Null
  }
}

# Aliases
Set-Alias c clear

function l {
  eza -alhF @args
}

function g- {
  git pull --rebase
}

function g+ {
  git push
}

# --- Dev shortcut + tab completion ---

$global:DEV_PATH = Join-Path $HOME "src"

function dev {
  param(
    [Parameter(Mandatory=$true, Position=0)]
    [string] $Name
  )

  $target = Join-Path $global:DEV_PATH $Name

  if (Test-Path $target -PathType Container) {
    Set-Location $target
  } else {
    Write-Error "Directory '$Name' not found under $DEV_PATH"
  }
}

# Argument completer for `dev`
Register-ArgumentCompleter -CommandName dev -ParameterName Name -ScriptBlock {
  param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

  if (-not (Test-Path $global:DEV_PATH)) { return }

  Get-ChildItem -LiteralPath $global:DEV_PATH -Directory -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -like "$wordToComplete*" } |
    ForEach-Object {
      [System.Management.Automation.CompletionResult]::new(
        $_.Name,
        $_.Name,
        'ParameterValue',
        $_.FullName
      )
    }
}