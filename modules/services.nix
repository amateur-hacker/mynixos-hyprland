{ pkgs, ... }: {
  services.displayManager.sddm.enable = true;
  services.printing.enable = false;
  services.openssh.enable = true;
}
