#!/usr/bin/env bash

echo Installing byzanz
sudo apt-get install autoconf byzanz

echo Installing lolilolicon/xrectsel and dependencies
git clone --depth 1 https://github.com/lolilolicon/xrectsel.git /tmp/xrectsel
cd /tmp/xrectsel
sh ./bootstrap
sh ./configure --prefix /usr
sudo apt-get install libx11-dev
make
make DESTDIR="/tmp/xrectsel" install
sudo cp usr/bin/xrectsel /usr/bin/xrectsel

echo Installing edouard-lopez/record-gif.sh
curl --location https://github.com/edouard-lopez/record-gif.sh/raw/master/record-gif.sh --output /tmp/record-gif.sh
sudo cp /tmp/record-gif.sh /usr/local/bin/record-gif.sh
sudo chmod +x /usr/local/bin/record-gif.sh
