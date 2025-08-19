# nanobind_uv_workspace_example

This is a [nanobind](https://github.com/wjakob/nanobind) example project featuring [uv](https://github.com/astral-sh/uv) [workspace](https://docs.astral.sh/uv/concepts/projects/workspaces) containing several interdependent `.whl` packages.

## Goals

* Figure out how a single `.whl` package can be split into multiple interdependent `.whl` packages.

* Trigger rebuilding of C++ bindings on every `uv run` during development.

## Caveats

* Since nanobind depends on the [Python interpreter](https://nanobind.readthedocs.io/en/latest/building.html#preliminaries), build isolation must be disabled in editable mode.

* Both `uv sync --no-build-isolation` and `uv build --no-build-isolation` require preinstalled [build dependencies](https://docs.astral.sh/uv/reference/settings/#no-build-isolation).

* See also `sync.{bat,sh}` and `build.{bat,sh}`.

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
