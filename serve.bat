@echo off

set requirements=pypiserver

uv venv --allow-existing
uv pip install %requirements%

uv run pypi-server run -v -p 80 dist
