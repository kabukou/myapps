$app_list=(Get-ChildItem .\*.lnk).BaseName
$check_app = Get-Process | ? {$_.ProcessName -eq $app_list[0]}
if($check_app -ne $null) {
	Get-Process | ? {$_.ProcessName -in $app_list} | % { Stop-Process $_}
} else {
	for($app_list.Count=1) {
        $tmp = $app_list[$i] + ".lnk"
		Invoke-Item $tmp
	}
}