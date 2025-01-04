#!/bin/bash
set -eu

sudo cp vim.desktop ~/.local/share/applications/
sudo chmod 644 ~/.local/share/applications/vim.desktop
update-desktop-database ~/.local/share/applications/
