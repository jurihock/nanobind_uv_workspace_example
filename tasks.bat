@echo off

uv run --with invoke invoke %* || exit /b
