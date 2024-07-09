new-module -name wlperfset -scriptblock {

Function Install-WlPerf()
{
	
	$ver = "0.01a"
	Write-Output "WL streaming perfcounter setup"
	Write-Output $ver
    mkdir c:\wlperf

    weget https://raw.githubusercontent.com/mscy/azure-v620/main/setperf.ps1 -outfile c:\wlperf\setperf.ps1
    weget https://raw.githubusercontent.com/mscy/azure-v620/main/CounterList.csv -outfile c:\wlperf\CounterList.csv
    weget https://raw.githubusercontent.com/mscy/azure-v620/main/startperf.ps1 -outfile c:\wlperf\startperf.ps1
    c:\wlperf\setperf.ps1
    Write-Output "run  c:\wlperf\startperf.ps1 to start collect perflog"
	Write-Output "Done"
}
set-alias wlperfset -value Install-WlPerf
export-modulemember -function 'Install-WlPerf' -alias 'wlperfset'
}
