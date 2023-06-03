@echo off
IF EXIST eula.txt (
  goto CHECKEULA
) ELSE (
  goto ASKEULA
)
IF %errlevel% EQU 1 goto END
:CHECKEULA
>nul find "eula=false" eula.txt && (
  goto ASKEULA
) || (
  goto END
)
:ASKEULA
echo "Do you agree to the Mojang EULA available at https://account.mojang.com/documents/minecraft_eula ?"
set /p EULA=[y/n]
IF /I "%EULA%" NEQ "y" GOTO END
echo eula=true>eula.txt
:END
"jre\jdk8u312-b07-jre\bin\java.exe" -javaagent:log4jfix/Log4jPatcher-1.0.0.jar -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx4096M -Xms4096M -jar forge-1.7.10-10.13.4.1614-1.7.10-universal.jar nogui