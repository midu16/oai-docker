# Description

Docker-compose file for running OpenAirInterface on docker. The included componets are as following:
```
- oai.ran

- oai.cn

- mysql

- phpmyadmin
```
In order to deply all the dockers for the openairinterface, please follow the following commands:
```
$ cd $PWD/oai-docker/openairinterface
$ docker-compose up -d 
```
In order to deploy all the dockers for the devopstools, please follow the following commands:
```
$ cd $PWD/oai-docker/devopstools
$ docker-compose up -d 
```

Documentation: 

[1] https://hub.docker.com/r/phpmyadmin/phpmyadmin/
