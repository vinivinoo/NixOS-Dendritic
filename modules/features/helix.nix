{ self, inputs, ... }: {

  flake.nixosModules.helix = { pkgs, lib, ... }: {
    programs.helix = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHelix;
    };
  };

  perSystem = { pkgs, libs, ... }: {

    packages.myHelix = inputs.wrapper-modules.wrappers.helix.wrap {
      settings = {
        editor = {
          line-number = "relative";
          color-modes = true;
          statusline = {
            left = [
              "mode"
              "spinner"
              "file-name"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            center = [ ];
            right = [
              "diagnostics"
              "selections"
              "register"
              "position"
              "position-percentage"
              "file-encoding"
            ];
            mode.normal = "NORMAL";
            mode.insert = "INSERT";
            mode.select = "SELECT";
          };
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
          indent-guides = {
            render = true;
          };
          soft-wrap = {
            enable = true;
          };
        };
      };
    };
  };
}
