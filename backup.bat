@echo off
mode con:cols=100 lines=12
set dst=%cd%\_backup

@echo == 세이브 파일 기본 위치 ==
@echo %userprofile%\Zomboid\Saves\ 게임모드 \ 세이브명
@echo.

set /p src="백업 대상 폴더를 입력하세요 : "

if exist "%src%" (
    @echo 대상 : "%src%"
) else (
    @echo 대상 폴더가 존재하지 않습니다.
	pause
	exit
)

:loop

rd /q /s "%dst%1" 2>nul
echo d|xcopy /s /y "%src%" "%dst%1" > nul
@echo 백업 : %dst%1
TIMEOUT 180

rd /q /s "%dst%2" 2>nul
echo d|xcopy /s /y "%src%" "%dst%2" > nul
@echo 백업 : %dst%2
TIMEOUT 180

rd /q /s "%dst%3" 2>nul
echo d|xcopy /s /y "%src%" "%dst%3" > nul
@echo 백업 : %dst%3
TIMEOUT 180

goto :loop
