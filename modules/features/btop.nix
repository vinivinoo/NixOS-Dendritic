{ self, inputs, ... }: {

  flake.nixosModules.btop = { pkgs, lib, ... }: {
    programs.btop = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myBtop;
    };
  };

  perSystem = { pkgs, libs, ... }: {

    packages.myBtop = inputs.wrapper-modules.wrappers.btop.wrap {
      settings = {
        color_theme = "catppuccin_mocha";
        vim_keys = true;
      };
    };
  };
}
