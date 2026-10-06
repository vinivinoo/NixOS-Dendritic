{ self, inputs, ... }: {

  flake.nixosModules.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myStarship;
    };
  };

  perSystem = { pkgs, libs, ... }: {

    packages.myStarship = inputs.wrapper-modules.wrappers.starship.wrap {
      settings = {
        character = {
          success_symbol = "[❯](green)";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](subtext1)";
        };

        git_branch = {
          style = "bold mauve";
        };

        directory = {
          truncation_length = 4;
          style = "bold lavender";
        };
      };
    };
  };
}
