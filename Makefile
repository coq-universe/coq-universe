.PHONY: help clean

DUNE_BIN=_build/install/default/bin/dune
DUNE=dune-ocaml/$(DUNE_BIN)

help:
	@echo "Welcome to Coq Universe, do 'make universe' to build"

$(DUNE):
	cd dune-ocaml && dune build --root . $(DUNE_BIN)

universe: $(DUNE)
	$(DUNE) build @install --display=short

clean:
	cd dune-ocaml && dune clean --root .
	dune clean
