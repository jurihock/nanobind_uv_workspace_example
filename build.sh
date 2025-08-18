#!/bin/sh

requirements='build'

uv venv --allow-existing
uv pip install ${requirements}

uv run python -m build --wheel --no-isolation --outdir dist .
uv run python -m build --wheel --no-isolation --outdir dist ./src/pycat
uv run python -m build --wheel --no-isolation --outdir dist ./src/pydog
uv run python -m build --wheel --no-isolation --outdir dist ./src/pypet
