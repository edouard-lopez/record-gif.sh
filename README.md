## Record-gif

> A lame GUI for [`byzanz`](https://github.com/GNOME/byzanz), improved the user experience (**mouse-selectable area**, record progress bar, **replay-able recording**).

![preview](./preview.gif)

### Features

* set recording `duration` ;
* set `save_as` destination ;
* **select –with the mouse–** the area to record ;
* **create a script to replay recording** (cf. `$HOME/record.again`).

### Install

Requirement [`xrectsel`](https://github.com/lolilolicon/xrectsel) is installed by the script.

```
curl --location https://git.io/record-gif.sh | bash -
```

### Progress bar

It's a self made script, the code is available on my repo [edouard-lopez/progress-bar.sh](https://github.com/edouard-lopez/progress-bar.sh) so you can use it in others cases.

### License

> [GPLv3](http://choosealicense.com/licenses/gpl-3.0/) inherited from [byzanz-record-window](https://askubuntu.com/questions/107726/how-to-create-animated-gif-images-of-a-screencast/201018#201018).
