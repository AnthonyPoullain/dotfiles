#!/bin/bash

is_fullscreen=$(yabai -m query --windows --window "$YABAI_WINDOW_ID" | jq -re '.["zoom-fullscreen"]')
has_border=$(yabai -m query --windows --window "$YABAI_WINDOW_ID" | jq -re '.["border"]')

if [[ "$is_fullscreen" -eq "1" ]]; then
  if [[ "$has_border" -eq "1" ]]; then
    yabai -m window "$YABAI_WINDOW_ID" --toggle border
  fi
else
  if [[ "$has_border" -eq "0" ]]; then
    yabai -m window "$YABAI_WINDOW_ID" --toggle border
  fi
fi
