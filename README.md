# Record-gif

> A lame GUI for [`byzanz`](https://github.com/GNOME/byzanz), improved the user experience (**mouse-selectable area**, record progress bar, **replay-able recording**).

![preview](./preview.gif)

## Features

* recording automation ;
* set recording `duration` ;
* set `save_as` destination ;
* **select –with the mouse–** the area to record ;
* **create a script to replay recording** (cf. `$HOME/.record.again`).

## Requirements

* `byzanz` (probably in your repo) ;
* [`xrectsel`](https://github.com/lolilolicon/xrectsel) is installed by the script.


## Install

```
curl --location https://git.io/record-gif.sh | bash -
```

## Usage

### Record

    record-gif.sh 10 ~/preview.gif

This will record for `10s`, and save GIF in `~/preview.gif`. If the file exists it's overwritten.

### Record again

You know cause the first time always fails, I save the command from **last session that completed** to record easily record again:

    ~/.record.again

This will record, after 3s delay as always, with the same `duration`, `destination` and `area`.

## Progress bar

It's a self made script, the code is available on my repo [edouard-lopez/progress-bar.sh](https://github.com/edouard-lopez/progress-bar.sh) so you can use it in others cases.

### License

> [GPLv3](http://choosealicense.com/licenses/gpl-3.0/) inherited from [byzanz-record-window](https://askubuntu.com/questions/107726/how-to-create-animated-gif-images-of-a-screencast/201018#201018).
