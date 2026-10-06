{
  self,
  inputs,
  pkgs,
  ...
}:
{
  flake.nixosModules.myLaptopConfiguration = {
    imports = [
      self.nixosModules.myLaptopHardware
    ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };

    programs = {
      xwayland.enable = true;
      niri.enable = true;
      zsh.enable = true;
      nix-ld.enable = true;
      fuse.userAllowOther = true;
    };

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    networking = {
      hostName = "thinkpad-t14";
      networkmanager = {
        enable = true;
      };
    };

    services = {
      pipewire = {
        enable = true;
        pulse.enable = true;
      };

      openssh = {
        enable = true;
        ports = [ 443 ];
      };

      blueman = {
        enable = true;
      };

      xserver = {
        enable = true;
        xkb = {
          layout = "de";
        };
      };

      flatpak = {
        enable = true;
      };

      keyd = {
        enable = true;
        keyboards.default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
            };
          };
        };
      };

      gvfs = {
        enable = true;
      };

      displayManager.sddm = {
        enable = true;
        # enable xserver instead of wayland to enable cursor
        wayland.enable = true;
      };

      power-profiles-daemon.enable = true;
      upower.enable = true;
    };

    hardware.bluetooth.enable = true;

    time.timeZone = "Europe/Berlin";

    i18n = {
      defaultLocale = "de_DE.UTF-8";
    };

    console = {
      keyMap = "de";
    };

    users.users.vini = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      shell = pkgs.zsh;
    };

    nixpkgs.config.permittedInsecurePackages = [
      "electron-40.10.5"
    ];

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    system.stateVersion = "25.05";
  };
}
