import re
import shutil

from invoke import task
from pathlib import Path

@task
def clean(_):

    root = Path(__file__).parent

    if (root / 'build').is_dir():
        shutil.rmtree(root / 'build')

    if (root / 'dist').is_dir():
        shutil.rmtree(root / 'dist')

    if (root / '.venv').is_dir():
        shutil.rmtree(root / '.venv')

    if (root / 'uv.lock').is_file():
        (root / 'uv.lock').unlink()

@task
def venv(_):

    activate = _.run('uv venv --allow-existing')
    activate = re.search(r'Activate with:\s*(.+)', str(activate))
    activate = activate.group(1).strip() if activate else None
    assert activate, f'Unable to parse the "activate with" command!'
    return activate

@task
def sync(_):

    requirements = ['uv_build>=0.8.11,<0.9.0', 'scikit-build-core>=0.11.5', 'nanobind>=2.8.0']

    with _.prefix(venv(_)):
        _.run('uv pip install ' + ' '.join(f'"{r}"' for r in requirements))
        _.run('uv sync --verbose --no-build-isolation --refresh --inexact --config-settings=editable.rebuild=true')

@task(sync)
def build(_):

    with _.prefix(venv(_)):
        _.run('uv build --verbose --no-build-isolation --all-packages --wheel')

@task
def serve(_):

    _.run('uv run --isolated --with pypiserver pypi-server run -v -p 80 dist')

@task
def test(_):

    with _.prefix(venv(_)):
        _.run('uv run test.py')
