@ECHO OFF
set a=0
echo ------------------------------------------------------------------
echo --                                                              --
echo --                           ��������                           --
echo --                                                              --
echo ------------------------------------------------------------------
:start
set b = %date:~0,4%.%date:~5,2%.%date:~8,2% %time:~0,2%:%time:~3,2%:%date:~8,2%
title ����� ����%a%�� �ϴ�������%b%
set date1=%date:~0,4%%date:~5,2%%date:~8,2%
set time1=%time:~0,2%%time:~3,2%%time:~6,2%
java -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true  -jar forge-1.12.2-14.23.5.2860.jar nogui
set date2=%date:~0,4%%date:~5,2%%date:~8,2%
set /a c=%time:~0,2%%time:~3,2%%time:~6,2% - %time1%
if %c% LEQ 1 (
   if %date2% == %date1% (
       echo ------------------------------------------------------------------
       echo --                                                              --
       echo --                  :( �����쳣,������������                  --
       echo --                  ������ѯ������,��������˳�                 --
       echo --                                                              --
       echo ------------------------------------------------------------------
       pause>null
       exit
   )
)
set /a a=%a%+1
echo ------------------------------------------------------------------
echo --                                                              --
echo --                       ����3����Զ�����                      --
echo --                       ������������ȴ�                       --
echo --                      ����ֱ�ӹرշ����                      --
echo --                                                              --
echo ------------------------------------------------------------------
timeout /T 3
g         