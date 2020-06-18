# LiDaServer

This repo contains scripts and instructions to use the Lida application. You have the choice among several nways to suit your needs:

-) all-in-one server: for this you need to have a dedicated host, possibly on you private cloud
-) Lida server with external MongoDB database server: for instance if you plan to have several servers referring to the same DB, or if you want to use a DBaaS (e.g. Atlas MongoDB)
-) as a VirtualBox VM: useful if you want to have a sandbox for testing and learning
-) as a docker container: tha black box way, the fastest way to have Lida up and running

# All in one server

This repo contains the instructions and the script to install the server for the LIDA annotator service. The server contains all needed to run the web server and the MongoDB NoSQL service. The script has been tested on a VirtualBox virtual machine, and needs to be adapted for different uses. The current configuration script envisions a VirtualBox VM with a graphical desktop, which may be unnecessary for a production server. This option too has not been tested. As is, the generated VM is appropriate for testing, debugging, and demonstration purposes.

## Hardware requirements

The hardware mounts a 64-bit CPU, with 1GB Ram and a 6GB HD. Such configuration leaves around 1GB for the database, which is deemed sufficient for testing and developing.

## Installation of the base system

The base machine is configured using the **minimal Ubuntu** installation disk. Follow the installation wizard without installing any package during the final *tasksel* phase.

## LIDA server configuration

Once the installation terminates, reboot the machine and install the git tool:

    $ sudo apt update
    $ sudo apt install git

and clone this repository 

    $ git clone https://github.com/AugustoCiuffoletti/LiDaServer.git
    $ cd LiDaServer

A few parameters can be configured in the install.sh script:

  * the switches for the non-graphical server, and to exclude the VirtualBox related configurations. Such options are not tested
  * the name of the main user, in case you want to use a different one (default is **user** with password *user*)

Edit the script with:

    $ nano install.sh

Finally run the script:

    $ sudo bash install.sh

which is designed to run unattended.

## VirtualBox VM tuning

-) enlarge the monitor to 1280x800
-) remove the screensaver from autostart applications
-) set the background with the provided one

## Run the server

Download the LIDA repository containing the LIDA environment you want to run and follow the instructions.

The file run.sh illustrates an example of a run script to automate this last step.

## Demo result

The .ova of the resulting VM can be downloaded from this [link](https://drive.google.com/open?id=1R0Lle6xFBqdtjNha4e5o47UgEGf9xHvG) 

