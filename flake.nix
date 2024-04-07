{
  description = "A nixos gnome wallpaper";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      rec {
        pkgs = import nixpkgs { inherit system; };

        name = "nixos-wallpaper";
        packages.default = (with pkgs;   stdenv.mkDerivation
          rec {
            pname = "nixos-wallpaper";
            version = "0.0.0";

            src = ./.;

            buildInputs = [
            ];

            installPhase = ''
              mkdir -p $out/share/backgrounds/gnome
              cp $src/nix-d.svg $out/share/backgrounds/gnome
              cp $src/thinknix-d.svg $out/share/backgrounds/gnome
              cp $src/thinknix-l.svg $out/share/backgrounds/gnome
              mkdir -p $out/share/gnome-background-properties
              cp $src/thinknix.xml $out/share/gnome-background-properties/thinknix.xml
            '';

            meta.mainProgram = "${pname}";
          });
      }
    );
}
