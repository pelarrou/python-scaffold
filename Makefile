# Define virtual environment directory
VENV_DIR = .venv
BIN_DIR = $(VENV_DIR)/bin

# Define the Python binary in the virtual environment
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip

# default target, when make executed without arguments
all: install lint format test

install: .venv/bin/activate

.venv/bin/activate: requirements.txt
	python3 -m venv $(VENV_DIR)
	$(BIN_DIR)/pip install --upgrade pip
	$(BIN_DIR)/pip install --upgrade -r requirements.txt

format:
	$(BIN_DIR)/black *.py

lint:
	$(BIN_DIR)/pylint --disable=R,C *.py
	$(BIN_DIR)/mypy --strict *.py

test:
	$(BIN_DIR)/python -m pytest -vv --cov=hello test_hello.py

flt: format lint test

.PHONY: all format lint test flt install
