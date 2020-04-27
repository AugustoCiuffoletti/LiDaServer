# LiDaServer

Si parte da una macchina ubuntu minima: nell'ultimo passo tasksel si lascia tutto in bianco.

Poi si avvia la macchina e si installa git

    $ sudo apt update
    $ sudo apt install git

Poi si clona questo repository. 

    $ git clone https://github.com/AugustoCiuffoletti/LiDaServer.git

Nella directory creata dal repo si edita il file install.sh per definire i pochi parametri variabili.

    $ cd LiDaInstall
    $ nano install.sh
    $ sudo 

Il nome dell'utente e il repo e branch del software LIDA. Poi si da il comando:

sudo bash install.sh

 
