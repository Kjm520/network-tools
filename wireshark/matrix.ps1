tshark -i 10 -l -x | Select-String '^\s*[0-9A-Fa-f]{4}\s' | ForEach-Object {
  $line = ""
  (($_ -replace '^\s*[0-9A-Fa-f]{4}\s+','') -split '\s+' | Select-Object -First 16) | ForEach-Object {
    try {
      $c = [char][Convert]::ToInt32($_,16)
      if ([int][char]$c -ge 32 -and [int][char]$c -le 126) { $line += $c } else { $line += "." }
    } catch {}
  }
  Write-Host -NoNewline $line
}