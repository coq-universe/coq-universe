.PHONY: help clean submodules

DUNE_BIN=_build/install/default/bin/dune
DUNE=dune-ocaml/$(DUNE_BIN)

help:
	@echo "Welcome to Coq Universe, do 'make universe' to build"
	@echo "If the submodules are not fetched, first do 'make submodules'"

$(DUNE):
	cd dune-ocaml && dune build --root . $(DUNE_BIN)

universe: $(DUNE)
	$(DUNE) build @install --display=short --error-reporting=twice

dune: $(DUNE)
	$(DUNE) $(ARGS)

submodules:
	git submodule update --init --recursive

clean:
	cd dune-ocaml && dune clean --root .
	dune clean
