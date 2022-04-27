#!/bin/bash
set -e
if (( $(id -u) == 0 )); then
    echo "Script is running as root"
else
    echo "Script should be run as root"
    exit
fi
cd
echo "[+] Installing zsh"
apt install -y zsh zsh-autosuggestions zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k tmux
read -p "Do you wish to install kali[k]/normal[n] " kn
case $kn in
    [Kk]* ) wget https://raw.githubusercontent.com/Iyaad-luqman/Uploads/uploads/kali-zshrc ; mv kali-zshrc .zshrc ;;
    [Nn]* ) wget https://raw.githubusercontent.com/Iyaad-luqman/Uploads/uploads/zshrc ; mv zshrc .zshrc;;
    * ) echo "Please answer [y/n]";;
esac
chsh -s /bin/zsh

echo "[+] Installing tmux"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
wget https://raw.githubusercontent.com/Iyaad-luqman/Uploads/uploads/tmux.conf
mv tmux.conf  ~/.tmux.conf.local
echo "[+] Changing IP"
wget https://raw.githubusercontent.com/Iyaad-luqman/Uploads/uploads/ip-change.py
sudo python3 ip-change.py
