{
    description = "A simple NixOS flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    };

    outputs = { self, nixpkgs, ...}@inputs: {
        nixosConfigurations."ted-nixos" = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                ({ pkgs, ... }: {
                    environment.systemPackages = with pkgs; [
                        zsh
                        neovim
                        wget
                        curl
                        git
                        alacritty
                        gcc
                        gnumake
                        unzip
                        ripgrep
                        xclip
                        vscodium
                    ];
                })
            ];
        };
    };
}
