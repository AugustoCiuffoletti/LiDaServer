#! /bin/bash
set -e

export DESKTOP="yes"    # Comment if graphical desktop is not required
export VM="yes"         # Comment if VirtualBox VM configuration is not required

export REPO=https://bitbucket.com/augusto_ciuffoletti/mlida
export BRANCH=gunicorn
export USER=user

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# sudo without password
cat > /etc/sudoers.d/$USER <<EOF
$USER ALL=(ALL:ALL) NOPASSWD:ALL
EOF
chmod 0440 /etc/sudoers.d/$USER

apt update
apt -y upgrade
apt install -y git openssh-server


if [[ ! -z $VM ]]
then
cat > /etc/netplan/02-hostonly.yaml <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s8:
      dhcp4: yes
EOF
fi

if [[ ! -z $DESKTOP ]]
then 
  apt install -y lubuntu-core^ geany curl
  # automatic login in lightdm
  cat > /etc/lightdm/lightdm.conf <<EOF
[SeatDefaults]
autologin-user=$USER
autologin-user-timeout=5
EOF
# Chrome
  apt install -y xdg-utils
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
# Robo3t
  mkdir -p /usr/local/bin/robomongo
  cd /usr/local/bin/robomongo
  wget https://download-test.robomongo.org/linux/robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
  tar -xvzf robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
  rm robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
  cd ..
  ln -sf robomongo/robo3t-1.3.1-linux-x86_64-7419c406/bin/robo3t .
fi

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
apt update
apt install -y mongodb-org
chown --recursive mongodb.mongodb /var/lib/mongodb
systemctl start mongod
systemctl enable mongod
apt install -y python-pip python3-venv

# The rest is executed as user at home
sudo -i -u $USER bash << EOF
cd
python3 -m venv lidaEnv
source lidaEnv/bin/activate
pip install pymongo[tls] dnspython gunicorn
git clone $REPO
cd mlida
git checkout $BRANCH
pip install -r requirements.txt
EOF

# See also run.sh script
echo "Now run:"
cat LiDaServer/run.sh
