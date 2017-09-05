
define HELP

This is the pytest testrail project Makefile.

Usage:

make requirements - Install dependencies
make coverage     - Run coverage analysis
make lint         - Run static analysis
make test         - Run static analysis, tests with coverage
make quicktest    - Run tests without coverage
make cleantest    - Run tests cleaning tox environment first
make clean        - Remove generated files
make deploy       - Deploys to artifactory
endef

export HELP


.PHONY: all clean help lint quicktest requirements test

version ?= `cat VERSION`
build_loc ?= $(shell pwd)

all help:
	@echo "$$HELP"


lint:
	flake8 pytest_testrail | tee pytest_testrail.txt

requirements: .requirements.txt

.requirements.txt: requirements/*.txt
	pip install -r requirements/base.txt
	pip freeze > $@

README.rst: README.md
	pandoc --from=markdown --to=rst --output=README.rst README.md

test: coverage lint
	tox

coverage:
	tox -e coverage

deploy:
	echo $(version)
	docker run \
		-v $(build_loc)/.pypirc:/root/.pypirc \
		-v $(build_loc):/app \
		python:3.6-slim \
		bash -c "cd /app && python setup.py bdist_wheel upload -r local"

clean:
	rm -rf .cache .coverage .tox pytests_py*-test.xml pytest_testrail.egg-info pytest_testrail.txt pytests_coverage.xml
	find . -name '*.pyc' -delete
