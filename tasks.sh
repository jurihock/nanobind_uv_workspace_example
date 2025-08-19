#!/bin/sh

uv run --isolated --no-project --with invoke invoke "$@" || exit $?
