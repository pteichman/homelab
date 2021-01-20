{ lib, pkgs, ... }:

let
  vars = import ./lib/vars.nix;

in {
  imports = [
    ./lib/system.nix
  ];

  networking = {
    hostName = "alpha";
    useDHCP = true;
  };

  services = {
    openssh = {
      enable = true;
      passwordAuthentication = false;
    };
  };
};
