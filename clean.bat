@echo off

del /f /s /q build 1>nul
rmdir /s /q build

del /f /s /q dist 1>nul
rmdir /s /q dist

del /f /s /q .venv 1>nul
rmdir /s /q .venv

del uv.lock 1>nul

uv cache clean
