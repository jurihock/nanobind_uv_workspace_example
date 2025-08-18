#!/bin/sh

requirements='uv_build>=0.8.11,<0.9.0 scikit-build-core>=0.11.5 nanobind>=2.8.0'

uv venv --allow-existing
uv pip install ${requirements}

uv build --verbose --no-build-isolation --all-packages --wheel
