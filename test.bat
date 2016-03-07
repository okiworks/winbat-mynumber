@echo off
setlocal enabledelayedexpansion

REM 12桁未満 or 12桁を超える
echo input:1234567890123
call validate_mynumber 1234567890123
echo input:1234567890
call validate_mynumber 1234567890123

REM 12345678901nの12桁
set number=12345678901
for /l %%I in (0,1,9) do (
  echo input:%number%%%I
  call validate_mynumber %number%%%I
)

endlocal
