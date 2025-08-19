@echo off

uv run --isolated --with invoke invoke %* || exit /b
