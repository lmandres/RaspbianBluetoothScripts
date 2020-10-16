macaddr=$1

pulseaudio --kill
sleep 1

sh setup_ofono.sh
sleep 1

pulseaudio --start -vvv
sleep 1

expect connect_bluetooth.exp $macaddr

sleep 1
macfmt=$(echo $macaddr | sed "s/:/_/g")
sh start_bluetooth.sh $macfmt
