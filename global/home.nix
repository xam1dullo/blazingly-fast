{ inputs, lib, pkgs, config, outputs, packages, ... }: {
  imports = (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = [
      outputs.overlays.nix-channels
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    stateVersion = "24.05";
    username = "pro";
    homeDirectory = "/home/pro";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;
}
