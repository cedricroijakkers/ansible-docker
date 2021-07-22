# About ansible-docker
A simple container with an ansible installation, which can be used if you cannot or don't want to use the system installed version of ansbile to roll out playbooks.

There are different containers for different OSes, different versions of Python, and different versions of Ansible.

# Usage
To run the `ansible-playbook` command inside the container, replace the `ansible-playbook` command with:

```sh
docker run --rm -i -v $(pwd):$(pwd) -w $(pwd) -v ~/.ssh:/root/.ssh cedricroijakkers/ansible-docker:$tag ansible-playbook
```

Example of a full command to run a playbook:

```sh
docker run --rm -i -v $(pwd):$(pwd) -w $(pwd) -v ~/.ssh:/root/.ssh cedricroijakkers/ansible-docker:$tag ansible-playbook -i inventories/foo playbooks/bar.yml
```

Replace `$tag` with the tag of the container of your choice.

# Maintainer
This container is built and maintained by [Cedric Roijakkers](mailto:cedric@roijakkers.be).