@echo off

set requirements=build

uv venv --allow-existing
uv pip install %requirements%

uv run python -m build --wheel --outdir dist --no-isolation .
uv run python -m build --wheel --outdir dist --no-isolation ./src/pycat
uv run python -m build --wheel --outdir dist --no-isolation ./src/pydog
uv run python -m build --wheel --outdir dist --no-isolation ./src/pypet
