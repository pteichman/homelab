{ pkgs, ... }:

let
  secrets = import ./secrets.nix;
in {
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "UTC";

  environment = {
    homeBinInPath = true;

    systemPackages = with pkgs; [
      curl
      git
      go
      tcpdump
    ];
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    autoOptimiseStore = true;
  };

  system = {
    autoUpgrade.enable = true;
    stateVersion = "20.09";
  };

  users = {
    mutableUsers = false;

    users.peter = {
      isNormalUser = true;
      uid = 1000;

      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDD/z39iwB45p96jqRZhRIIWKj5ZNrx3zT20MNM3Sevn1gJ8NPcfEXXx1F7StSMHcTm3Yuz8kwAl0wcRct4JIOEcPDYn8BHQkQZnBS6hEIGtd+jjMXDRGQyROWzQMy4w8jhGjaUSgRAhFyV1oqp9ZkvALf6w47RzfOaFgDUjiq9CHEaauBzkMB+TmZ6lNkcgfIaITu36Cn0MBDbhEBDScRcGdHBwLEXB8wQfL4IrZz1soOtK2jUPQfFjNBycqv0fQTg+iDyhn51tIgsUBtrcYWRiyvJWIYZAI/PjWOXVqsXk4MjI2sow4Osf8qNxKAw+AfDBwAOmJdsJQ8hdSKXH1e7HQl+4CAEwIFVwoYX4awS1vSw72CgzpllOKk3acFo9EbioDiaSKq0H3s8hsyf7DDavGWFYGWtcio4eM7mAlrhYjHDwXWgUZjHBIuN39vZspopbvelZYkBgYq8tvmut15tqjynmaMq6qS93gs8uZVqE9hn4I7DQ1/F96DIsJPLHFxMw1ihg7NAogE6tbzHCD2hpPkjgDh03Xxf18/XIVraHIfOD26MtyD4b2ucKjkOKSXZZEQwrgH/a1Xy5U8yGeh3hKwBHiVOe4uj5TEvDcuVyx97uQ1RAQz2g7CovdEdndJrXBSEZI4+qOIK9FhiuzzVj3ncQMFeF5nXEfbBzit0tQ== pteichman@fastly.com"
      ];
    };
  };
};
