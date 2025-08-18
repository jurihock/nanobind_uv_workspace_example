# nanobind_uv_workspace_example

This is a [nanobind](https://github.com/wjakob/nanobind) example project featuring [uv](https://github.com/astral-sh/uv) [workspace](https://docs.astral.sh/uv/concepts/projects/workspaces) containing several interdependent `.whl` packages.

## Goals

* Figure out how a single `.whl` package can be split into multiple interdependent `.whl` packages.

* Trigger rebuilding of C++ bindings on every `uv run` during development.

## Gotchas

* `uv sync editable.rebuild=true` still creates a temporary environment for the build dependencies, which breaks the incremental build. This can be prevented by `uv sync --no-build-isolation`, but requires additional `.venv` manipulations.

  Workaround: `sync.{bat,sh}`.

* `uv build` insistently creates an isolated build environment rather than reusing existing build artifacts. This can slow down large projects considerably. It also appears to fail with C++ dependencies in uv workspaces.

  Workaround: `build.{bat,sh}`.

## Basic usage

Build and run `test.py` example:

```
sync.{bat,sh}
test.{bat,sh}
```

Build `dist\*.whl` files:

```
sync.{bat,sh}
build.{bat,sh}
```

## Advanced usage

Serve built `dist\*.whl` files:

```
serve.{bat,sh}
```

Use served `dist\*.whl` files:

```
cd example
uv run example.py
```

## Dependencies

C++:

|C++ Library|Dependency|
|-----------|----------|
|`pet`||
|`cat`|`pet`|
|`dog`|`pet`|

Python:

|Python Library|Python Dependency|C++ Dependency|
|--------------|-----------------|--------------|
|`pypet`||`pet`|
|`pycat`|`pypet`|`cat`|
|`pydog`|`pypet`|`dog`|
|`pypets`|`pypet` `pycat` `pydog`||
