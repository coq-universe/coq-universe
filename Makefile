.PHONY: help universe dune submodules clean install-opam-deps dunestrap

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
	menhir \
	lablgtk3-sourceview3

help:
	@echo "Welcome to Coq Universe, do 'make universe' to build"
	@echo "If the submodules are not fetched, first do 'make submodules'"

$(DUNE):
	cd dune-ocaml && make release

# For interactive use
DUNEOPT?=

dunestrap:
	make -C coq-master dunestrap

universe: $(DUNE)
	$(DUNE) build @install $(DUNEOPT)

dune: $(DUNE)
	$(DUNE) $(ARGS)

submodules:
	git submodule update --init --recursive

submodules-deinit:
	git submodule deinit -f .

SUBMODULES?= \
	Abel \
	bigenough \
	CompCert \
	Coq-Equations \
	coq-master \
	dune-ocaml \
	finmap \
	flocq \
	Coq-HoTT \
	math-comp \
	mczify \
	real-closed \
	tarjan

submodules-init:
	git submodule update --init $(SUBMODULES)

clean: $(DUNE)
	$(DUNE) clean
	$(DUNE) clean --root dune-ocaml

install-opam-deps:
	opam install $(OPAM_DEPS) -y $(ARGS)
