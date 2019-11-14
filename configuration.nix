# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # "/dev/disk/by-id/wwn-0x50004cf20c7b0b02";
  boot.loader.grub.configurationLimit = 20;
  boot.loader.grub.useOSProber = true;

  #  networking.hostName = "E6440"; # Define your hostname.
  networking.networkmanager.enable = true;
#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # allow unfree software for users
  nixpkgs.config.allowUnfree = true;

  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;

    desktopManager = {
	default = "none";
	xterm.enable = false;
      };

    windowManager.i3 = {
	enable = true;
	extraPackages = with pkgs; [
	  dmenu
	  rofi
	  i3lock
	  i3blocks
	];
      };

  xkbOptions = "caps:escape,shift:both_capslock";
    };

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  #tlc
  services.tlp.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixos = {
     isNormalUser = true;
     extraGroups = [ "wheel" "netowkrmanager" ]; # Enable ‘sudo’ for the user.
   };

  #passwordless sudo
  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

  #install packages
  environment.systemPackages = 
    with pkgs;
    [
	vim
	firefox
	w3m
	tlp
	libreoffice
	openjdk
	ifuse
	hdparm
	sayonara
	neofetch
	youtube-dl
	gnome3.gnome-calculator
	networkmanager
	jetbrains.idea-community
	gnome3.zenity
	mpv
	xvkbd
	discord
	thunderbird
	pinta
	xfce.thunar
	gparted
	transmission
	x11vnc
	cmake
	ecryptfs
	ecryptfs-helper
	tmux
	undervolt
	p7zip
	mprime
	phantomjs
	ranger
   ];	

}

