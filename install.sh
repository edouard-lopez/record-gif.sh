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
curl --location --output https://github.com/edouard-lopez/byzanz-gui/blob/master/byzanz-gui /tmp/byzanz-gui
cd /tmp/byzanz-gui
sudo cp /tmp/byzanz-gui/byzanz-gui /usr/bin/byzanz-gui
