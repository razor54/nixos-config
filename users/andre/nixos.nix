{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  users.users.andre = {
    isNormalUser = true;
    home = "/home/andre";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$3yfIb8HfuVj1KOaT$0Pt71HYUtinfTzRXniNBCIMAF9tiKxBHPf/DFkSq4idyG7SIHHQOvymsRzG0Kna5LHQ/SM1GQ0sp01zWy2Tae/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIILBwvkB16dWegKd9W+iU7d9J/6wwkdp/IezS5yN9qJu andre@one.network"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
