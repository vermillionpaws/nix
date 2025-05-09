{
  description = "Vermi's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      chaotic,
      ...
    }@inputs:
    {
      nixosConfigurations.hydrogen = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        # specialArgs = { inherit inputs; };
        modules = [
          ./modules/linux/default.nix
          ./modules/options.nix
          chaotic.nixosModules.default
        ];
      };
    };
}
