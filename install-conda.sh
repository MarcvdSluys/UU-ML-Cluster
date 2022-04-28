#!/bin/bash

err() {
    echo -e "\n\n\nERROR $@, aborting...\n\n\n"
    exit 1
}

WORKDIR="/data/gravwav/$USER/ML/Conda-install"
echo -e "\nInstalling Conda from $WORKDIR..."
mkdir -vp $WORKDIR || err "creating Conda directory"
cd $WORKDIR

echo -e "\nDownloading installer:"
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh  || err "downloading Conda"

CondaDir="/data/gravwav/$USER/.conda"
echo "Installing Conda in $CondaDir/"
time bash Miniforge3-Linux-x86_64.sh -b -p $CondaDir || err "installing Conda"
source $CondaDir/bin/activate || err "activating Conda"
conda init || err "initialising Conda"

# rm -f Miniforge3-Linux-x86_64.sh  ||  err "cleaning up"

