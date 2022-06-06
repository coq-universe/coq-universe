.PHONY: help universe dune submodules clean install-opam-deps

# This build works without dune being installed. In order for this to work, we
# use the bootstrapping mechanism in the build of dune.

ifdef OS
	EXE=.exe
else
	EXE=
endif

DUNE=./dune-ocaml/_build/install/default/bin/dune$(EXE)

OPAM_DEPS=\
	ocamlfind \
	zarith \
	menhir

help:
	@echo "Welcome to Coq Universe, do 'make universe' to build"
	@echo "If the submodules are not fetched, first do 'make submodules'"

$(DUNE):
	cd dune-ocaml && make release

universe: $(DUNE)
	$(DUNE) build @install --display=short --error-reporting=twice

dune: $(DUNE)
	$(DUNE) $(ARGS)

submodules:
	git submodule update --init --recursive

clean: $(DUNE)
	$(DUNE) clean
	$(DUNE) clean --root dune-ocaml

install-opam-deps:
	opam install $(OPAM_DEPS) -y $(ARGS)
