# export DESKTOP    # Uncomment if graphical desktop is required
# export VM         # Uncomment if VirtualBox VM is required

export REPO=https://github.com/davivcu/lida
export BRANCH=experimental/login

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

apt update
apt upgrade
apt install git openssh-server

if [[ $VM ]];
then
# attivazione rete hostonly
fi

if [[ $DESKTOP ]];
then 
  apt install lubuntu-core^ geany
# Chrome
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb
# Robo3t
  mkdir /usr/local/bin/robomongo
  cd /usr/local/bin/robomongo
  wget https://download-test.robomongo.org/linux/robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
  tar -xvzf robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
  rm robo3t-1.3.1-linux-x86_64-7419c406.tar.gz
  cd ..
  ln -s robomongo/robo3t-1.3.1-linux-x86_64-7419c406/bin/robo3t .
fi

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
apt update
apt install -y mongodb-org
chown --recursive mongodb.mongodb /var/lib/mongodb
systemctl start mongod
systemctl enable mongod
apt install python-pip python3-venv

# Qui uscire da root e fare come studente nella sua home

source lidaEnv/bin/activate
pip install pymongo[tls] dnspython gunicorn
git clone $REPO
cd lida
git checkout $BRANCH
pip3 install -r requirements.txt

echo "Now run:"
echo "  development server: python lida_app.py or"
echo "  production server:  gunicorn --bind 0.0.0.0:5000 app:LidaApp"

 

