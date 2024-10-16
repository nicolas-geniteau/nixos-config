{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    nixos-config-work.url = "flake:nixos-config-work"; # Must be added to flake registry!

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

    helix-editor.url = "github:helix-editor/helix";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    pre-commit-hooks,
    ...
  }: {
    nixosConfigurations.nicolas = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        work_inputs = inputs.nixos-config-work.outputs.work_inputs;
      };

      modules =
        [
          ./hosts/nicolas

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nicolas = import ./home;

            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ]
        ++ inputs.nixos-config-work.outputs.host_configs;
    };
    nixosConfigurations.nuc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
        work_inputs = inputs.nixos-config-work.outputs.work_inputs;
      };

      modules =
        [
          ./hosts/nuc

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nicolas = import ./home;

            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ]
        ++ inputs.nixos-config-work.outputs.host_configs;
    };
    checks = {
      x86_64-linux = {
        pre-commit-check = pre-commit-hooks.lib.x86_64-linux.run {
          src = ./.;
          hooks = {
            alejandra.enable = true;
          };
        };
      };
    };
  };
}
