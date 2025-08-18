#!/bin/sh

rm -rf build
rm -rf dist
rm -rf .venv
rm -f  uv.lock

uv cache clean
