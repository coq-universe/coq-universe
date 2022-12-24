{
  description = "coq-universe";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
  };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
        ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          dune_3
          ocaml
          ocamlPackages.findlib
          ocamlPackages.zarith
          ocamlPackages.menhir
          ocamlPackages.lablgtk3-sourceview3
        ];
      };
    };
}
