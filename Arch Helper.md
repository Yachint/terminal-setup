# Artix-Arch Helper 
Some tips on setting up certain features from a Clean/Base install. Instructions are given with ID like AB1234 to easily list if one process is dependent on the other and vice versa. Some instructions might be based on openrc init system. Please find suitable commands in runit, s6 or systemd to follow along.

## LightDM setup with DWM
***! This process is liked with [], please first carry out that to follow instructions here. !***

The main components are:
- lightdm
- lightdm-webkit2-greeter (Login theme/GUI)

```
sudo pacman -S lightdm lightdm-webkit2-greeter
```

After that we basically need to create a desktop entry that would start dwm when we login. The catch is that like .xinitrc, we need to launch various other programs like nitrogen and picom before launching dwm. For that we will give the executable as a script rather thaj just 'dwm'.

***It is very important to chmod +x both the desktop entry and the script to make it so that LightDM can execute them after we login with our user since by default only root user can do it***

## Sound Setup (SU001)
To enable sound we require these packages:
- alsa
- alsa-utils
- alsamixer (To control volume through terminal)
- pulseaudio (Required by browsers like Firefox and GUI Frontend)
- pavucontrol (GUI for controlling audio)

```
sudo pacman -S alsa alsa-utils alsamixer pulseaudio pavucontrol
```


## Mouse Accelaration (MA002)
Find your mouse in the list of input devices using:
```
xinput list
```

Note down its ID and use the following command to decrease/increase speec (Range: -1 to 1):
```
xinput --set-prop 12 'libinput Accel Speed' -0.7
```
