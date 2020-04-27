# LiDaServer

Si parte da una macchina ubuntu minima: nell'ultimo passo tasksel si lascia tutto in bianco.

Poi si avvia la macchina virtuale e si installa git

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

Nell'interfaccia grafica è opportuno:
-) allargare il monitor a 1280x800
-) rimuovere dalle applicazioni lanciate al boot lo screensaver
-) impostare il background

Per avviare il server è possibile eseguire i singoli comandi oppure lo script

    $ run.sh

