# PSServiceDemo

## 要件

- Microsoft Windows 11+
- Windows PowerShell 5.1+
- [NSSM - the Non-Sucking Service Manager](https://nssm.cc/)

## インストール

```powershell
# powershell.exe を管理者権限で実行
$serviceName = "MyService"

git clone https://...
Set-Location .\PSServiceDemo

$powershellCommand = Get-Command powershell.exe
$powershellCommandPath = $powershellCommand.Path

$scriptItem = Get-Item .\script.ps1

$scriptDirectoryItem = $scriptItem.Directory
$appDirectory = $scriptDirectoryItem.FullName

$fullName = $scriptItem.FullName
$appParameters = '-NoLogo -ExecutionPolicy ByPass -NoProfile -File "{0}"' -f $fullName

nssm install $serviceName $powershellCommandPath
nssm set $serviceName Application $powershellCommandPath
nssm set $serviceName AppDirectory $appDirectory
nssm set $serviceName AppParameters $appParameters

# 設定を確認する。
nssm edit $serviceName

# ソースを加える。
New-EventLog -LogName Application -Source MyServiceSource

# 開始する。
nssm start $serviceName
```

## イベント ログを参照する

```powershell
Get-EventLog -LogName Application -Source nssm,MyServiceSource -Newest 15
```

## アンインストール

## Source を消す

```powershell
# powershell.exe を管理者権限で実行
nssm remove $serviceName
Remove-EventLog -Source MyServiceSource
```
