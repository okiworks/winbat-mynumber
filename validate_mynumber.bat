@echo off
REM validate_mynumber.bat
REM マイナンバーのチェックデジットを検証する
REM 参考：http://qiita.com/qube81/items/fa6ef94d3c8615b0ce64
setlocal enabledelayedexpansion
call :calc_strlen %1
if %strlen% neq 12 echo requires 12-digit input & goto end

set mynumber=%1
set check_digit=%mynumber:~-1%
set /a sum=0
set temp=%mynumber:~0,-1%

for /l %%I in (1,1,11) do (
  if %%I leq 6 (
    set /a q=%%I+1
  ) else (
    set /a q=%%I-5
  )
  set p=!temp:~-1!
  set /a sum+=!p!*!q!
  set temp=!temp:~0,-1!
)
set /a remainder=!sum!%%11

if !remainder! leq 1 (
  set check=0
) else (
  set /a check=11-!remainder!
)
if !check_digit! equ !check! (
  echo true
) else (
  echo false
)
goto end

:calc_strlen
set str=%1
set strlen=0
:loop_calc
if defined str (
  set str=%str:~1%
  set /a strlen+=1
  goto :loop_calc
)
exit /b

:end
endlocal
