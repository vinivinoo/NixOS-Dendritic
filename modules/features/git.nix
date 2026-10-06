{ self, inputs, ... }: {

  flake.nixosModules.git = { pkgs, lib, ... }: {
    programs.git = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myGit;
    };
  };

  perSystem = { pkgs, libs, ... }: {

    packages.myGit = inputs.wrapper-modules.wrappers.git.wrap {
      settings = {
        user = {
          name = "vinivinoo";
          email = "antoni.vince92@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
