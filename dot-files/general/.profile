

export MULLVAD_SERVER=$(doas get-mullvad-server)
echo $MULLVAD_SERVER >> ~/past-servers.txt

export CAFFEINATE=0

EDITOR="emacs"
TERMINAL="alacritty"
BROWSER="firefox"
VIDEO="mpv"
