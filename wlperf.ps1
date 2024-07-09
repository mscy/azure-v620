new-module -name v620init -scriptblock {

Function Install-Project()
{
	
	$ver = "0.02a"
	Write-Output "Azure AMD V620(NG) Setup source for WL env"
	Write-Output $ver

	Write-Output "Download AMD V620 Driver"
	# wget https://download.microsoft.com/download/b/5/9/b5906014-ea8f-4195-83fa-e016e11dc141/AMD-Azure-Cloud-Gaming-Driver-380774E-22Q2.exe -outfile amdv620.exe

	Write-Output "Download and install Azcopy"
	wget https://aka.ms/downloadazcopy-v10-windows -outfile azcopy.zip
	Expand-Archive .\azcopy.zip .\az\ -Force
	copy .\az\azcopy_windows_amd64*\*.* C:\Windows\

	Write-Output "Download GS(WL)"
        $gs = "https://setupsource.blob.core.windows.net/file/Ver_4.16.0.3.zip?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2223-06-20T10:47:46Z&st=2023-06-20T02:47:46Z&spr=https,http&sig=wPpS0%2B9ubaL9GhqmCLHq8sA8V%2F6NoLoAxFF38vZ%2BB8s%3D"
	azcopy cp $gs  .\Ver_4.16.0.3.zip
	Expand-Archive .\Ver_4.16.0.3.zip c:\ -Force

	Write-Output "Download Well-link Basic Setup helper"
	$helper = "https://setupsource.blob.core.windows.net/file/x86BasicEnvironment.exe?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2223-06-20T10:47:46Z&st=2023-06-20T02:47:46Z&spr=https,http&sig=wPpS0%2B9ubaL9GhqmCLHq8sA8V%2F6NoLoAxFF38vZ%2BB8s%3D"
	azcopy cp $helper .\x86BasicEnvironment.exe
	mkdir c:\Basic
	copy .\x86BasicEnvironment.exe c:\Basic
	
	Write-Output "Download Well-link AutoVOS 1.3"
	$autoVos = "https://setupsource.blob.core.windows.net/file/AutoVOS_v1.3.zip?sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupiytfx&se=2223-06-20T10:47:46Z&st=2023-06-20T02:47:46Z&spr=https,http&sig=wPpS0%2B9ubaL9GhqmCLHq8sA8V%2F6NoLoAxFF38vZ%2BB8s%3D"
	azcopy cp $autoVos .\AutoVOS_v1.3.zip
	Expand-Archive  .\AutoVOS_v1.3.zip c:\AutoVOS_v1.3 -Force

	Write-Output "Done"
}
  set-alias azinit -value Install-Project
  export-modulemember -function 'Install-Project' -alias 'azinit'
}
