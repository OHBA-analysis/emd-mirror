# vim: set noexpandtab ts=4 sw=4:
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = emd
SOURCEDIR     = doc/source
BUILDDIR      = doc/build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

all: install
	python3 setup.py build

install:
	python3 setup.py install

clean:
	python3 setup.py clean
	rm -fr build
	rm -fr doc/build
	rm -fr emd.egg-info

all-clean: install-clean
	python3 setup.py build

install-clean: clean
	python3 setup.py install

test:
	python3 -m pytest emd

doc: doc-html

doc-html:
	python3 setup.py build_sphinx

spell:
	codespell -s --ignore-words=ignore_words.txt `find . -type f -name \*.py`

.PHONY: help Makefile
