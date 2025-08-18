# nanobind_uv_workspace_example

This is a [nanobind](https://github.com/wjakob/nanobind) example project featuring [astral-sh/uv](https://github.com/astral-sh/uv) workspace containing several interdependent `.whl` packages.

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

Serve `dist\*.whl` files:

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
