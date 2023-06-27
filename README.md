# Azure-AMD-v620 setup resoure and logs 

run 
. { iwr -useb https://raw.githubusercontent.com/mscy/azure-v620/main/init.ps1 } | iex; azinit


===

Logon as adminuser
mkdir c:\Basic
复制 x86BasicEnvironment.exe 到c:\Basic
 切到c:\Basic  管理员 运行cmd
 x86BasicEnvironment.exe -step="start"  会自动重启 启动之后
Logon as administrator
 x86BasicEnvironment.exe -step="startAzure"
等待安装自动重启即可
所有步骤执行完 
需要运行 c:\Basic\SandboxieInstall64.exe  
x86BasicEnvironment.exe  -step="check" 或者使用power shell 运行 C:\rsync\script\yanzheng.ps1 通过之后
x86BasicEnvironment.exe  -step="latest" 
如果不需要打镜像   直接手动重启即可，如果需要打镜像 关闭所有目录  重启机器即可
重启完成之后  使用
用户名:administrator  密码:rZ2fT7gH3N
