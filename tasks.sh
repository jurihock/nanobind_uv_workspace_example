#!/bin/sh

uv run --with invoke invoke "$@" || exit $?
