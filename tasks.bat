@echo off

uv run --isolated --no-project --with invoke invoke %* || exit /b
