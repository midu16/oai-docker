# Description

This project is an independent extension of the following project: https://gitlab.eurecom.fr/oai/openairinterface5g/wikis/home.


Components of OpenAirInterface on docker are the followings:
```
- oai.ran

- oai.cn

- mysql

- phpmyadmin
```

If you will want to manually execute the deploy of dockers , please follow the following commands:
```
$ cd $PWD/docker-install/roles/files/oai-docker/openairinterface
$ docker-compose up -d 
```

Notes:

If there are any issues, dont hesitate to open an Issue ticket.

Documentation: 

[1] https://hub.docker.com/r/phpmyadmin/phpmyadmin/

[2] https://gitlab.eurecom.fr/oai/openairinterface5g/wikis/home

[3] https://github.com/OPENAIRINTERFACE/openair-cn/wiki

[4] https://github.com/fzdarsky/openair-k8s