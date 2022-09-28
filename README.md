# Welcome to the Coq Universe Project!

[![CI](https://github.com/ejgallego/coq-universe/actions/workflows/ci.yml/badge.svg)](https://github.com/ejgallego/coq-universe/actions/workflows/ci.yml)

## Introduction and Goals

Coq Universe aims to provide a composed build of all active Coq projects that is
a starting point for:

- large-scale refactoring and tooling
- proof mining and exploration
- incremental testing
- uniform and easy building of Coq projects
- reproducible builds

Coq Universe takes inspiration from the following projects:
- [Dune Universe](https://github.com/dune-universe/dune-universe)
- [opam-monorepo](https://github.com/ocamllabs/opam-monorepo) 
- [Dune build system](https://github.com/ocaml/dune)
- [Isabelle's Archive of Formal Proofs](https://www.isa-afp.org/)

Coq Universe is developed by Ali Caglayan and Emilio J. Gallego Arias.

Feel free to stop by our [Zulip stream](https://coq.zulipchat.com/#narrow/stream/327010-Coq-Universe) to discuss about this project.

## Components

Coq Universe is built using Dune, and for now, aims to include
projects present in Coq's CI system, but we will develop a formal
policy for our relationship with upstream soon.

## Getting started

After downloading the repository, fetch all the sources for the submodules using
```
make submodules
```

afterwards build everything (only OCaml and Dune are required!) using
```
make universe
```

### Submission to Coq Universe

For now we require that participating projects use Dune and are already present
in Coq's CI.

Coq Universe requires that the project uses Dune Coq mode to build,
and that builds against Coq master.

### Dune roadmap

In order to start porting all CI projects to Dune Universe, we'd like
to request upstream developers to adopt Dune. Unfortunately, this is
not possible yet, missing features are:

- Dune theories can't detect other theories that are installed
  globally; this requires a full extension

- Dune setup for native compute is cumbersome, as it doesn't detect
  the configure option. This should be easy to fix nowadays.

Once these two issues are solved, I think Dune Coq mode should be
approaching 1.0 status.

## Community and Code of Conduct

Code of Conduct will be added soon. This is a community project.
