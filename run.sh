#!/usr/bin/env bash

# Python + Env Setup Script 
# Pyuu by actwu

py() {
if [ "$1" = "up" ]; then
if command -v apt >/dev/null 2>&1; then
sudo apt update
sudo apt install -y python3 python3-pip python3-venv
elif command -v pacman >/dev/null 2>&1; then
sudo pacman -Syu --noconfirm python python-pip python-virtualenv
elif command -v pamac >/dev/null 2>&1; then
pamac install --no-confirm python python-pip python-virtualenv
elif command -v flatpak >/dev/null 2>&1; then
flatpak install -y flathub org.python.Python
else
echo "no supported package manager found"
fi
else
echo "usage: py up"
fi
}

pip() {
if [ "$1" = "up" ]; then
python3 -m pip install --upgrade pip
if command -v apt >/dev/null 2>&1; then
sudo apt install -y python3-venv
elif command -v pacman >/dev/null 2>&1; then
sudo pacman -S --noconfirm python-virtualenv
elif command -v pamac >/dev/null 2>&1; then
pamac install python-virtualenv --no-confirm
elif command -v flatpak >/dev/null 2>&1; then
flatpak install -y flathub org.freedesktop.Sdk.Extension.python3
else
echo "no supported package manager found"
fi
else
shift 0
if [ -n "$VIRTUAL_ENV" ]; then
command pip install "$@"
echo "added $* to env"
else
echo "no env active, run 'env on' first"
fi
fi
}

env() {
if [ "$1" = "on" ]; then
if [ -z "$VIRTUAL_ENV" ]; then
if [ ! -d venv ]; then
python3 -m venv venv
echo "env created"
fi
source venv/bin/activate
echo "env activated"
else
echo "already in env"
fi
elif [ "$1" = "off" ]; then
if [ -n "$VIRTUAL_ENV" ]; then
deactivate
echo "env deactivated"
else
echo "no env active"
fi
else
echo "usage: env on|off"
fi
}

echo "Initializing setup..."
py up
pip up

echo "Done. You can now use env on/off and pip <package> under active env"
