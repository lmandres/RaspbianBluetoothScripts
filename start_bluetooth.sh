macaddr=$1

while [ 1 ]; do
    testvar=$(pacmd set-card-profile bluez_card.$macaddr headset_head_unit)
    echo $testvar
    if [ -z "$testvar" ]; then
        break
    fi
    sleep 1
done

pacmd set-default-sink bluez_sink.$macaddr.headset_head_unit
pacmd set-default-source bluez_source.$macaddr.headset_head_unit
