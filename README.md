# nanobind_uv_workspace_example

This is a [nanobind](https://github.com/wjakob/nanobind) example project featuring [astral-sh/uv](https://github.com/astral-sh/uv) workspace containing several interdependent `.whl` packages.

## Usage

Build and run `test.py` example:

```
sync.bat
test.bat
```

Build `dist\*.whl` files:

```
sync.bat
build.bat
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
