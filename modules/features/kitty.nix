{ self, inputs, ... }: {

  flake.nixosModules.kitty = { pkgs, lib, ... }: {
    programs.kitty = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty;
    };

    fonts.packages = [
      pkgs.nerd-fonts.fira-code
    ];
  };

  perSystem = { pkgs, libs, ... }: {

    packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      settings = {
        font_family = "FiraCode Nerd Font";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";

        font_size = 14;

        background_opacity = 0.9;

        window_padding_width = "0 10 0 10";
        # cursor_trail = 1;
      };
    };
  };
}
