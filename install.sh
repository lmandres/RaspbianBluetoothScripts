apt update && apt -y upgrade
apt -y install bluetooth expect pulseaudio pulseaudio-module-bluetooth ofono ofono-phonesim xvfb

systemctl enable ofono
systemctl start ofono
