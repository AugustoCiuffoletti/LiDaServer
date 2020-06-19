# LiDaServer

This repo contains scripts and instructions to use the Lida annotator server. You have the choice among several ways to suit your needs:

* all-in-one server: for this you need to have a dedicated host, possibly on you private cloud
* Lida server with external MongoDB database server: for instance if you plan to have several servers referring to the same DB, or if you want to use a DBaaS (e.g. Atlas MongoDB)
* as a VirtualBox VM: useful if you want to have a sandbox for testing and learning
* as a docker container: tha black box way, the fastest way to have Lida up and running

## All-in-one server

For this you need a PC with enough HD capacity to support the database, and CPU capabilities to support a number of users to suit your needs. The base system in a **minimal Ubuntu** installation.

On top of this you need to install the software packages for the MongoDB server and for the python backend. You may have an idea of that looking in the *install.sh* script, probably discarding all packages and configurations that relate to graphical tools, unless you want to have them available on your server. The server may be running inside your intranet, or, at your risk, expose a public IP.

Once the server is configured you can download the code from the LiDa repository, and run the server using the script *run.sh* that you find in this package.

## LiDa server with external MongoDB database

For this you need a PC to support the LiDa PC, and a MongoDb database, either installed on premises or in the cloud. We have tested the server with the Atlas MongoDB service.

The steps are the same outlined above, except that you do not need to install the MongoDB packages and you do not need to provide the disk space for your dialogs.

You need to configure the URL of the MongoDB server as a parameter of the MongoClient constructor in the server/database_config.py file

## Lida-in-the-box

It is possible to create a VirtualBox machine to play with *lida*, evaluate its capabilities, and learn about its operation. It is also helpful to practice with its installation, and for development. The architecture is the same as for the all-in-one server, with the only difference that all the installation steps are performed in the VM. It may be useful to have a graphic interface available to edit files and access the server from inside the VM itself.

The script has been tested on a VirtualBox virtual machine, and needs to be adapted for different uses. The current configuration script envisions a VirtualBox VM with a graphical desktop, which may be unnecessary for a production server. This option too has not been tested. As is, the generated VM is appropriate for testing, debugging, and demonstration purposes.

### Hardware requirements

The hardware mounts a 64-bit CPU, with 1GB Ram and a 6GB HD. Such configuration leaves around 1GB for the database, which is deemed sufficient for a sandbox.

### Installation of the base system

The base machine is configured using the **minimal Ubuntu** installation disk. Follow the installation wizard without installing any package during the final *tasksel* phase.

### LIDA server configuration

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

### VirtualBox VM tuning

* enlarge the monitor to 1280x800
* remove the screensaver from autostart applications
* set the background with the provided one

### Run the server

Download the LIDA repository containing the LIDA environment you want to run and follow the instructions.

The file run.sh illustrates an example of a run script to automate this last step.

### Ready-to-use image

The .ova of the resulting VM can be downloaded from this [link](https://drive.google.com/open?id=1R0Lle6xFBqdtjNha4e5o47UgEGf9xHvG). Check and synchronize with the current lida repository.

## Dockerized Lida

For this alternative you need to have a MongoDB server available either on premises or in the cloud, as seen above. 

We provide the deployment script and instructions for the user that wants to regenerate the Docker image, which is also available on dockerhub.

FOLLOWING STEPS TO COMPLETE

To launch the container, run the command:

    $ docker run -d --network=host mastrogeppetto/dockerlida

You need to manually update the URL of your server in server/database_config.py. 



