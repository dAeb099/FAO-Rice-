#!/bin/bash
sleep 0.5
echo "
         __  _   __              _
   _____/ /_(_) / /_  __   _____(_)_______
  / ___/ __/ / / / / / /  / ___/ / ___/ _ \\
 (__  ) /_/ / / / /_/ /  / /  / / /__/  __/
/____/\__/_/_/_/\__, /  /_/  /_/\___/\___/
               /____/

"

echo "Starting installation..."
echo "WARNING! The installer will ask you your user password, installer need it for installing packages."
sleep 1

echo "
    ____           __        __  _
   /  _/___  _____/ /_____ _/ / (_) ____  _____
   / // __ \/ ___/ __/ __  / / / / / __ \/ __ /
 _/ // / / (__  ) /_/ /_/ / / / / / / / /_/ / _ _
/___/_/ /_/____/\__/\__,_/_/_/_/_/ /_/\__, (_|_|_)
                                     /____/

"

# Installing packages from official repos
sudo pacman -S --needed --noconfirm alacritty nautilus zellij tmux fastfetch \
    waybar networkmanager swww wofi swaync \
    wl-clipboard cliphist gimp noto-fonts-emoji \
    bandwhich gping cava cmatrix \
    hyprlock vim neovim helix grim slurp btop nvtop

# Cloning yay (AUR helper)
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd ./yay/
    makepkg -si --noconfirm
    cd ./../
    rm -rf ./yay/
fi

yay -S --noconfirm bonsai tty-clock wlogout wofi-emoji


echo "
   ______                  _
  / ____/___  ____  __  __(_)___  _____
 / /   / __ \/ __ \/ / / / / __ \/ __ /
/ /___/ /_/ / /_/ / /_/ / / / / / /_/ / _ _
\____/\____/ .___/\__, /_/_/ /_/\__, (_|_|_)
          /_/    /____/        /____/

"

# Copying configuration files
cp -r ./.config/* ~/.config/
cp -r ./Wallpapers/ ~/
sudo cp -r ./sugar-candy/ /usr/share/sddm/themes/
sudo cp -r ./sddm.conf /etc/


echo "
    ____                   __
   / __ \____  ____  ___  / /
  / / / / __ \/ __ \/ _ \/ /
 / /_/ / /_/ / / / /  __/_/
/_____/\____/_/ /_/\___(_)

"

echo "Installing finished!"
echo "Reboot recommended."



