#!/usr/bin/env bash

echo Installing lolilolicon/xrectsel and dependencies
git clone --depth 1 https://github.com/lolilolicon/xrectsel.git /tmp/xrectsel
cd /tmp/xrectsel
sh ./bootstrap
sh ./configure --prefix /usr
sudo apt-get install libx11-dev
make
make DESTDIR="/tmp/xrectsel" install
sudo cp xrectsel /usr/bin/xrectsel

echo Installing edouard-lopez/byzanz-gui
curl --location https://github.com/edouard-lopez/byzanz-gui/raw/master/byzanz-gui --output /tmp/byzanz-gui
sudo cp /tmp/byzanz-gui /usr/local/bin/byzanz-gui
sudo chmod +x /usr/local/bin/byzanz-gui
