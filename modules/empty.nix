{ self, inputs, ... }: {

  flake.nixosModules.name = { pkgs, lib, ... }: {
    programs.name = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.Name;
    };
  };

  perSystem = { pkgs, libs, ... }: {

    packages.Name = inputs.wrapper-modules.wrappers.name.wrap {
      settings = {

      };
    };
  };
}
