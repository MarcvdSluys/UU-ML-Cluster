#!/bin/bash

##  setup-ml-course.sh:  creates a Conda environment for the machine-learning course.
##  2022-04-26, MvdS:  initial version.

err() {
    echo -e "\n\n\nERROR $@, aborting...\n\n\n"
    exit 1
}


WORKDIR="/data/gravwav/$USER/ML/Conda-install"

echo -e "\nCreating a Conda environment for the machine-learning course."
echo -e "This will take about 15 minutes...\n"

echo -e "\nSetting up Conda from $WORKDIR..."
mkdir -vp $WORKDIR || err "creating Conda directory"
cd -v $WORKDIR


echo -e "\nDownloading configuration..."
wget https://github.com/scaudill/machine-learning-for-physics/raw/main/Cluster/ml_course.yml  ||  err "downloading configuration file"


echo -e "\nCreating environment..."
conda env create -f ml_course.yml  ||  err "creating Conda environment"  # ~15 min

