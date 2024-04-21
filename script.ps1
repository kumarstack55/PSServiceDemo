Write-Host "starting loop..."
Write-EventLog -LogName Application -Source MyServiceSource -EventId 1 -EntryType Information -Message "starting loop..."
while ($true) {
    Write-Host "writing event log..."
    Write-EventLog -LogName Application -Source MyServiceSource -EventId 1 -EntryType Information -Message "test"
    Start-Sleep 30
}
