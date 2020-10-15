Xvfb :1 -screen 0 1x1x8 &
while [ 1 ]; do
    fbstat=$(xdpyinfo -display :1 2>&1 | grep -a "unable to open display")
    if [ -z "$fbstat" ]; then
        break
    fi
    echo "Waiting for Xvfb to start . . ."
    sleep 1
done
    
DISPLAY=:1 ofono-phonesim -p 12345 /usr/share/phonesim/default.xml &
sleep 1

while [ 1 ]; do
    dbstat=$(DISPLAY=:1 dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:"true" 2>&1 | grep -a "Operation failed")
    if [ -z "$dbstat" ]; then
        break
    fi
    echo "Waiting for dbus . . ."
    sleep 1
done
