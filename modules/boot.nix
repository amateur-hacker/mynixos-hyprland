{ config, pkgs, ... }: {
  boot = {
    loader = {
      timeout = 5;
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
    # Appimage Support
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
      magicOrExtension = "\\x7fELF....AI\\x02";
    };
    plymouth.enable = true;
  };
  boot.kernelParams = [ "acpi_backlight=vendor" ];
}
