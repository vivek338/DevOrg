@echo off
> filename_prefix-%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log (
echo Your Name Here
echo Beginning Date/Time: %DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log
REM do some stuff here
echo Your Name Here
echo Ending Date/Time: %DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log
)