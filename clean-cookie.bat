@echo off
set rsq_path=C:%HOMEPATH%\AppData\Roaming\rishiqing
set rsq_cookie_path=%rsq_path%\Cookies
set rsq_cookie_journal_path=%rsq_path%\Cookies-journal
set rsq_exe_program=rishiqing.exe
echo INFO: begin to clean rishiqing cache file

rem check rsq_path exist
if not exist %rsq_path% (
	echo WARN: rishiqing path not exist
	pause
	exit
)

echo cleaning......
rem kill rishiqing.exe process
tasklist /FI "IMAGENAME eq %rsq_exe_program%" 2>NUL | find /I /N "%rsq_exe_program%">NUL
if "%ERRORLEVEL%"=="0" (
	echo INFO: killing process %rsq_exe_program%
	taskkill /IM %rsq_exe_program% /F
	echo INFO: waiting 5 seconds for %rsq_exe_program% killed
	timeout 5 > NUL
) else (
	echo INFO: %rsq_exe_program% not found
)
rem delete cookie file
if exist %rsq_cookie_path% (
	echo INFO: deleting file: %rsq_cookie_path%
	del %rsq_cookie_path%
	echo INFO: done delete file %rsq_cookie_path%
) else (
	echo WARN: %rsq_cookie_path% not found
)
rem delete cookie journal file
if exist %rsq_cookie_journal_path% (
	echo INFO: deleting file: %rsq_cookie_journal_path%
	del %rsq_cookie_journal_path%
	echo INFO: done delete file %rsq_cookie_journal_path%
) else (
	echo WARN: %rsq_cookie_journal_path% not found
)
pause
@echo on