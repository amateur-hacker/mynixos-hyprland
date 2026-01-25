{ pkgs, ... }: {
  # Use fish by default for all users
  users.defaultUserShell = pkgs.fish;

  users.users.amateur_hacker = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    # To set password in declarative way use 'mkpasswd -m sha-512 "mypassword"'
    hashedPassword =
      "$6$QfZdw3HTtKJmu7GK$mba88FSTf9HNAQPhC/nEYhf/K/4VJycK0NUe6my3Cy6QP7bR3rfuzubPL9Cj1lGDCCoMfDVOP7m2Z58IMX5es0";
    # packages = with pkgs; [ ];
  };
}
