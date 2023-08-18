@ECHO OFF
set a=0
echo ------------------------------------------------------------------
echo --                                                              --
echo --                           正在启动                           --
echo --                                                              --
echo ------------------------------------------------------------------
:start
set b = %date:~0,4%.%date:~5,2%.%date:~8,2% %time:~0,2%:%time:~3,2%:%date:~8,2%
title 服务端 重启%a%次 上次重启于%b%
set date1=%date:~0,4%%date:~5,2%%date:~8,2%
set time1=%time:~0,2%%time:~3,2%%time:~6,2%
java -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true  -jar forge-1.12.2-14.23.5.2860.jar nogui
set date2=%date:~0,4%%date:~5,2%%date:~8,2%
set /a c=%time:~0,2%%time:~3,2%%time:~6,2% - %time1%
if %c% LEQ 1 (
   if %date2% == %date1% (
       echo ------------------------------------------------------------------
       echo --                                                              --
       echo --                  :( 启动异常,请检查启动参数                  --
       echo --                  或者咨询其他人,按任意键退出                 --
       echo --                                                              --
       echo ------------------------------------------------------------------
       pause>null
       exit
   )
)
set /a a=%a%+1
echo ------------------------------------------------------------------
echo --                                                              --
echo --                       将在3秒后自动重启                      --
echo --                       按任意键跳过等待                       --
echo --                      或者直接关闭服务端                      --
echo --                                                              --
echo ------------------------------------------------------------------
timeout /T 3
g         