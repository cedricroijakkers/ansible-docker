# Building the containers
A script is provided to generate the Dockerfiles and build the containers

# Container list
Dockerfiles are templated, so edit the file `images.csv` adding a line with three colums, seperated with a comma:

* Python base image tag
* Ansible version number to install
* Dockerfile template to use

An example would be:

```
3.8.11-buster,2.9.24,Dockerfile-debian.template
```

This will create a Dockerfile pulling from the image `python:3.8.11-buster` and installing Ansible `2.9.24` inside. It will use the template file `Dockerfile-debian.template`.

# Building
When done editing the csv file, just run the command `./build.sh` to generate the Dockerfiles and build all the images.