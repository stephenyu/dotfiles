#!/bin/bash
ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | grep ' SSID')

if [[ $ssid == *"Canva"* ]]; then
  slack status edit --text "In the Office" --emoji :office: &>/dev/null
else
  slack status edit --text "WFH" --emoji :house: &>/dev/null
fi
