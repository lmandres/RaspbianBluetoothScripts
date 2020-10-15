ofono-phonesim -p 12345 /usr/share/phonesim/default.xml &
sleep 1
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:"true"
