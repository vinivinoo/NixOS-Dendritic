{ self, inputs, ... }: {
  flake.nixosConfiguration.myLaptop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.myLaptopConfiguration
    ];
  };
}
