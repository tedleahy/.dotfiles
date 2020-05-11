#! /usr/bin/bash

bat0_max_charge=$(cat /sys/class/power_supply/BAT0/energy_full)
bat1_max_charge=$(cat /sys/class/power_supply/BAT1/energy_full)
total_max_charge=$((bat0_max_charge + bat1_max_charge))

bat0_current_charge=$(cat /sys/class/power_supply/BAT0/energy_now)
bat1_current_charge=$(cat /sys/class/power_supply/BAT1/energy_now)
total_current_charge=$((bat0_current_charge + bat1_current_charge))

total_percentage_decimal=$(bc -l <<< "($total_current_charge / $total_max_charge) * 100")
total_percentage=$(bc <<< "$total_percentage_decimal / 1")

bat0_status=$(cat /sys/class/power_supply/BAT0/status)
bat1_status=$(cat /sys/class/power_supply/BAT1/status)

charging=""
if [ "$bat0_status" == "Charging" ] || [ "$bat1_status" == "Charging" ]; then
  charging="Charging... "
fi

if [ "$total_percentage" -ge 0 ] && [ "$total_percentage" -le 5 ]; then
  icon=""
elif [ "$total_percentage" -gt 5 ] && [ "$total_percentage" -lt 50 ]; then
  icon=""
elif [ "$total_percentage" -ge 50 ] && [ "$total_percentage" -lt 75 ]; then
  icon=""
elif [ "$total_percentage" -ge 75 ] && [ "$total_percentage" -lt 98 ]; then
  icon=""
elif [ "$total_percentage" -ge 98 ]; then
  icon=""
fi

if (("$total_percentage" > 100)); then
  output="$charging 100%"
else
  output="$icon $charging $total_percentage%"
fi

echo "$output"
