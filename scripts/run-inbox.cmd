@echo off
cd /d "%~dp0.."
"C:\Users\CRISTIAN\AppData\Roaming\npm\claude.cmd" -p "/inbox" --allowedTools "Read Write Glob Grep" --permission-mode acceptEdits >> "%~dp0..\vault\salidas\inbox-log.txt" 2>&1
