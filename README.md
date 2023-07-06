# Azure-AMD-v620 setup resoure and logs 

run 
. { iwr -useb https://raw.githubusercontent.com/mscy/azure-v620/main/init.ps1 } | iex; azinit


===

Logon as adminuser<br>
mkdir c:\Basic<br>
复制 x86BasicEnvironment.exe 到c:\Basic <br>
 切到c:\Basic  管理员 运行cmd <br>
 x86BasicEnvironment.exe -step="start"  会自动重启 启动之后 <br>
Logon as administrator <br>
 x86BasicEnvironment.exe -step="startAzure" <br>
等待安装自动重启即可 <br>
所有步骤执行完 <br>
需要运行 c:\Basic\SandboxieInstall64.exe<br>  
x86BasicEnvironment.exe  -step="check" 或者使用power shell 运行 C:\rsync\script\yanzheng.ps1 <br>
通过之后
x86BasicEnvironment.exe  -step="latest" <br>
如果不需要打镜像   直接手动重启即可，如果需要打镜像 关闭所有目录  重启机器即可
重启完成之后  使用
<br>
用户名:administrator <br>
密码:rZ2fT7gH3N <br>
