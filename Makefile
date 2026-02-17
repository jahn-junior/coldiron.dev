UV_LINT_GROUPS := "--group=lint" "--group=dev"

VENV := .venv
UV := uv
SPHINXBUILD := $(VENV)/bin/sphinx-build
SOURCEDIR := src
BUILDDIR := _build

.PHONY: install html clean lint

install:
	$(UV) sync

html: install
	$(SPHINXBUILD) -b dirhtml $(SOURCEDIR) $(BUILDDIR)

clean:
	rm -rf $(BUILDDIR) $(VENV) **/*.egg-info .*_cache

lint:
	echo 'Not implemented'