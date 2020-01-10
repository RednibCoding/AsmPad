::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Template task.bat you can use to run your project
:: from within AsmPad.
:: Click "Run File" from within AsmPad to run the task.bat
:: that should be located in the same folder as your
:: project file.

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Config your stuff here
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: file name you want to compile
set _fileName=myfile

:: file extension of your file
set _fileExt=asm

:: command to execute
set _command=fasm %_fileName%.%_fileExt% %_fileName%.exe

:: 1 = run executable after compilation
:: 0 = don't run executable after compilation
set _run_executable=1

:: when task.bat has been finished executing:
:: 0 = wait for user input before closing
:: 1 = close console immediately
set _close_when_finished=0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


echo delete:    %_fileName%.exe
if exist %_fileName%.exe del %_fileName%.exe

if not exist %_fileName%.%_fileExt% goto over1
echo run:       %_command%
%_command%

if not exist %_fileName%.exe goto over2

if /i %_run_executable%==1 (
	echo execute:   %_fileName%.exe
	echo.
	%_fileName%.exe
)

goto theEnd

:over1
echo.
echo Error:    %_fileName%.%_fileExt% does not exist
goto theEnd

:over2
echo.
echo Error:    %_fileName%.exe does not exist
goto theEnd

:theEnd
echo.
if /i not %_close_when_finished%==1 pause
