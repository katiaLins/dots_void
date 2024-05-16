#!/bin/bash

echo "Welcome to a simple script to get a minimally customised Hyprland on Void Linux."
read -p "Would you like to continue (y/n)? " installChoice

case "$installChoice" in
  # User wants to continue installation
  y|Y|yes|Yes|YES )

    read -p "Would you like to perform a system upgrade before continuing (y/n)? " upgradeChoice
    case "$upgradeChoice" in
      y/Y/yes/Yes/YES )
        echo "Upgrading system..."
        sudo pacman -Syu
      ;;
      n/N/no/No/NO )
        echo "Skipping system upgrade."
      ;;
    esac

    echo "Preparing to install other packages..."
    ler \
         
      echo "Installing file managers..."
        sudo xbps-install -S  xf86-video-vmware xf86-video-vesa mesa wayland wayland-protocols wayland-utils dbus avahi curl wget git xz unzip zip nano vim gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers gtksourceview4 ffmpeg mesa-vdpau mesa-vaapi utoconf automake bison m4 make libtool flex meson ninja optipng sassc
        sudo xbps-install -Rs void-repo-nonfree 

      
      echo "Installing utilities and system tools..."
        sudo xbps-install -S gdm gnome-shell gnome-backgrounds gnome-terminal nautilus  gnome-control-center gnome-settings-daemon gnome-shell-extensions gnome-terminal firefox
        sudo sudo xbps-install -Rs xdg-desktop-portal xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk xdg-utils gnome-browser-connector
      echo "Installing additional applications..."
        sudo xbps-install -S neofetch btop grub-customizer gvfs-mtp gvfs ntfs-3g mpv
        
        # Edit the following list of additional applications or replace them with your own preferences
        
        # Audio
        echo "Installig audio"
        sudo xbps-install pulseaudio pulseaudio-utils pulsemixer alsa-plugins-pulseaudio bluez

        echo "Install LibreOffice:"
        sudo xbps-install libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-draw libreoffice-math libreoffice-base libreoffice-gnome libreoffice-i18n-pt-BR

        # Code editor
        echo "Installing flatpak..."
        sudo sudo xbps-install -S flatpak
         
        
        # Screenshot utility
        echo "Installing Screenshot Utility..."
        sudo xbps-install NetworkManager

        # Web browser
        echo "Starting services..."
        sudo sudo ln -s /etc/sv/gdm /var/service/
        sudo ln -s /etc/sv/NetworkManager /var/service/
        sudo ln -sv /etc/sv/bluetoothd /var/service
        sudo sudo ln -s /etc/sv/dbus /var/service/

        sudo reboot
        

        	
    echo "All done! Please reboot for all changes to take effect."
  ;;

  # User does not want to continue installation.
  n|N|no|No|NO )
    echo "Thanks for trying, Goodbye!";;
esac
