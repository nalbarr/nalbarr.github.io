# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = nalbarrgithubio
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

gh-build:
	@echo "gh-build"
	make clean html

gh-preview:
	@echo "gh-preview"
	make gh-build
	open $(BUILDDIR)/html/index.html

gh-commit:
	echo "gh-commit"
	pushd "$(BUILDDIR)"/html/
	tar cf - . | (cd ../.. && tar xf -)
	popd
	git add .
	
.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
