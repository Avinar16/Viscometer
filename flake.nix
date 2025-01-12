{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          cmake
          gdb
          qt6.full
          qt6.qtbase
          qt6.qtquick3d

          qt6.wrapQtAppsHook
          makeWrapper
          bashInteractive
        ];
        shellHook = ''
          bashdir=$(mktemp -d)
          makeWrapper "$(type -p bash)" "$bashdir/bash" "''${qtWrapperArgs[@]}"
          exec "$bashdir/bash"
        '';
      };
    };
}
