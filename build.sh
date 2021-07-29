#!/usr/bin/env bash

# Break on any error
set -e

# Configure the base name of the image to build here
containerbase="cedricroijakkers/ansible-docker"

cat images.csv | while IFS=',' read -r pythonver ansiblever template galaxycomgenver
do
    # If the line starts with a hash, it's a comment and skip it
    if [[ ${pythonver::1} == "#" ]]
    then
        continue
    fi

    # Else create a directory and generate a Dockerfile
    echo -e "\e[36mGenerating Dockerfile for image ${ansiblever}-${pythonver}...\e[39m"
    mkdir -p "${ansiblever}-${pythonver}"
    cat "${template}" | sed -e "s/%%PLACEHOLDER_PYTHON_IMAGE%%/${pythonver}/g" | sed -e "s/%%PLACEHOLDER_ANSIBLE_VERSION%%/${ansiblever}/g" | sed -e "s/%%PLACEHOLDER_GALAXY_COM_GEN_VERSION%%/${galaxycomgenver}/g" > "${ansiblever}-${pythonver}/Dockerfile"
    echo -e "\e[32mDockerfile generation: DONE\e[39m"

    # And build the docker container in question
    echo -e "\e[36mBuilding container for image ${ansiblever}-${pythonver}...\e[39m"
    docker build -t "${containerbase}":"${ansiblever}"-"${pythonver}" ./"${ansiblever}"-"${pythonver}"
    echo -e "\e[32mContainer build: DONE\e[39m"
done