{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {
    defaultPackage.aarch64-darwin = self.packages.aarch64-darwin.get-secret;

    packages.aarch64-darwin.get-secret =
      let pkgs = import nixpkgs { system = "aarch64-darwin"; };
      in pkgs.writeShellScriptBin "get-secret" ''
        echo ${pkgs.pass}

        echo "yooooo"
      '';

  };
}
