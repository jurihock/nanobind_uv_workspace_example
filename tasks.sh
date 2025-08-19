#!/bin/sh

uv run --isolated --with invoke invoke "$@" || exit $?
