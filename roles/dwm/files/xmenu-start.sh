#!/bin/sh
xmenu <<EOF | sh &
Aplicativos
    Google-Chrome google-chrome-stable
    Terminal (st) st
    Vscode code

Shutdown        sudo poweroff
Reboot          sudo reboot
EOF

