apt update && apt -y upgrade
apt -y install bluetooth expect pulseaudio pulseaudio-module-bluetooth ofono ofono-phonesim xvfb x11-utils

systemctl enable ofono
systemctl start ofono
