# default target, when make executed without arguments
all: .venv/bin/activate lint format test

.venv/bin/activate: requirements.txt
	python3 -m venv .venv
	./.venv/bin/pip install --upgrade pip
	./.venv/bin/pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C *.py
	mypy --strict *.py

test:
	python -m pytest -vv --cov=hello test_hello.py

flt: format lint test

.PHONY: all format lint test flt