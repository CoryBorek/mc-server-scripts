# mc-server-scripts
A series of batch scrpts for handling a Minecraft Server running on a debian-based system.

## Requirements
 - Debian-based Linux Distro (Ubuntu, Debian, PopOS, etc.)
 - wget


## Usage:

Make a directory that you want to have your minecraft server in.

```bash
mkdir -p path/to/directory
cd path/to/directory
```


Run the following commands to get the install script working.

```bash
sudo apt install wget
wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/install.sh
chmod +x ./install.sh
```

To run, use `./install.sh`

NOTE: this install script has multiple steps, so you will need to run it multiple times.
