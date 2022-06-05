.PHONY: $(DUNE) help clean submodules

#
# This build works without dune being installed. In order for this to work, we
# use the bootstrapping mechanism in the build of dune.
#

DUNE_EXE=dune-ocaml/dune.exe
DUNE=$(DUNE_EXE) exec --root dune-ocaml -- dune

OPAM_DEPS=\
	ocamlfind\
	zarith\
	menhir

help:
	@echo "Welcome to Coq Universe, do 'make universe' to build"
	@echo "If the submodules are not fetched, first do 'make submodules'"

$(DUNE_EXE):
	make -C dune-ocaml dune.exe

universe: $(DUNE_EXE)
	$(DUNE) build @install --display=short --error-reporting=twice

dune: $(DUNE_EXE)
	$(DUNE) $(ARGS)

submodules:
	git submodule update --init --recursive

clean: $(DUNE_EXE)
	$(DUNE) clean
	$(DUNE_EXE) clean --root dune-ocaml

install-opam-deps:
	opam install $(OPAM_DEPS) -y $(ARGS)
