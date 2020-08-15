@echo off
title Command Prompt Batch
ver
echo William Puchy
echo.
:Loop
set /P the="%cd%>"
%the%
echo.
goto loop