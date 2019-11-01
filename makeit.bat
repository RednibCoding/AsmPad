@echo off

if not exist rsrc.rc goto over1
\MASM32\BIN\Rc.exe /v rsrc.rc
\MASM32\BIN\Cvtres.exe /machine:ix86 rsrc.res
:over1

if exist AsmPad.obj del AsmPad.obj
if exist AsmPad.exe del AsmPad.exe

\MASM32\BIN\Ml.exe /c /coff AsmPad.asm
if errorlevel 1 goto errasm

if not exist rsrc.obj goto nores

\MASM32\BIN\Link.exe /SUBSYSTEM:WINDOWS AsmPad.obj rsrc.obj
if errorlevel 1 goto errlink

dir AsmPad.*
goto TheEnd

:nores
\MASM32\BIN\Link.exe /SUBSYSTEM:WINDOWS AsmPad.obj
if errorlevel 1 goto errlink
dir AsmPad.*
goto TheEnd

:errlink
echo _
echo Link error
goto TheEnd

:errasm
echo _
echo Assembly Error
goto TheEnd

:TheEnd

pause

