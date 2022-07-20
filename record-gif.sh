#!/usr/bin/env bash
delay=3
duration=${1:-10}
save_as=${2:-$HOME/recorded.gif}
area=$(shift 2; echo "$@")

start_audio=/usr/share/sounds/freedesktop/stereo/camera-shutter.oga
end_audio=/usr/share/sounds/freedesktop/stereo/complete.oga

notify() {
    message=${1:-''}
    audio="${2}"

    echo "$message"
    if [[ -f $audio ]]; then
      paplay $audio &
    fi
}

# xrectsel from https://github.com/lolilolicon/xrectsel
select_area() {
  local area
  area="${1}"

  if [[ -z "$area" ]]; then
    area=$(xrectsel "--x=%x --y=%y --width=%w --height=%h") || exit -1
  fi

  echo $area
}

countdown() {
  local delay=$1

  printf "Start recording in: "
  for (( i=$delay; i>0; --i )) ; do
      printf "%s\b" "$i"
      sleep 1
  done
  printf "\r"
}

progress-bar() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  printf "\n"
}

remove_existing() {
  if [[ -f $save_as ]]; then
    rm $save_as
    printf "Existing record will be overwritten.\n"
  fi
}

create_replay() {
  local seletected_area="$1"
  local duration=$2
  local save_as="$3"
  local executable="$0"

  echo "$executable $duration $save_as ${seletected_area}" > $HOME/.record.again
  chmod u+x $HOME/.record.again
}
run() {
  printf "Saving in %s%s\n" "$save_as"
  remove_existing
  printf "Recording for %ss.\n\n" "$duration"
  printf "Select Area to record…\n"

  seletected_area="$(select_area "$area")"
  countdown $delay
  create_replay "$seletected_area" "$duration" "$save_as"
  printf "You can replay this recording by running: \n  $ bash %s\n\n" "$HOME/.record.again"
  notify "Recording…                        " "$start_audio"

  progress-bar $duration &
  byzanz-record --verbose --delay=0 ${seletected_area} --duration=$duration $save_as > /dev/null

  notify "Finished!" "$end_audio"
}

run
