#SSH Daemon (CentOS 7 & Supervisor)

[![Circle CI](https://circleci.com/gh/million12/docker-ssh/tree/master.svg?style=svg&circle-token=2617eeffb09429d084c4ae16b58505dcbfc10c2f)](https://circleci.com/gh/million12/docker-ssh/tree/master)


[million12/ssh](https://registry.hub.docker.com/u/million12/ssh/) docker image with SSHD running under CentOS 7 and Supervisor. 

#### Usage
to be able to connect user can provide port and password for `root` user. Please see examples below.  

Example:  

	docker run \
		-d \
		--name ssh \
		-p 10022:22 \
		million12/ssh

**if `root` passoword is not provided image will generate one and it can be retrived from logs**  
    
    docker logs ssh
    [SSHD 09:49:22] root password set to: ota7zohsh0AZu2Ex

Login using that password:  

    ssh root@docker.io -p 10022 
    root@docker.ip's password: ota7zohsh0AZu2Ex

#### Environmental Variable

`ROOT_PASS` = root user password

#### Custom Password deployment

Example:  

	docker run \
		-d \
		--name ssh \
		-p 10022:22 \
		--env="ROOT_PASS=my_pass" \
		million12/ssh
        
### Docker troubleshooting


Use docker command to see if all required containers are up and running: 

    $ docker ps -a

Check online logs of ssh container:

    $ docker logs ssh

Attach to running ssh container (to detach the tty without exiting the shell, 
use the escape sequence Ctrl+p + Ctrl+q):

    $ docker attach ssh

Sometimes you might just want to review how things are deployed inside a running container, you can do this by executing a _bash shell_ through _docker's exec_ command:

    docker exec -i -t ssh /bin/bash

History of an image and size of layers: 
 
    docker history --no-trunc=true million12/ssh | tr -s ' ' | tail -n+2 | awk -F " ago " '{print $2}'

---
## Author

Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.