LISTENER:=PATHTOLISTENER
IPREAL='IPADDRESS'

build:
	@cd jenkins2 && docker-compose -p jenkins2 build
	@cd jenkins2 && docker-compose -p jenkins2 pull proxy

run:
	@cd jenkins2 && docker-compose -p jenkins2 up -d nginx data master proxy

runnod:
	@cd jenkins2 && docker-compose -p jenkins2 up nginx data master proxy

stop:
	@cd jenkins2 && docker-compose -p jenkins2 stop

chown:
	@sudo chmod 777 /var/run/docker.sock

runonce:
	@sudo chmod 777 changeme.sh && ./changeme.sh

open:
	x-www-browser http://localhost:80

openkafka:
	x-www-browser http://localhost:3030

opengit:
	x-www-browser https://git.kpn.org/projects/TQR

stopkafka:
	@docker stop dkafka

runkafka:
	@docker run --rm -d -p 2181:2181 -p 3030:3030 -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 9092:9092 --net=host -e ADV_HOST=$(IPREAL) --name dkafka landoop/fast-data-dev

listen:
	@docker run -ti --rm -d -v $(LISTENER):/py rpartapsing/dshpython3 python3 kafkaConsumerTenant.py

listennod:
	@docker run -ti --rm -v $(LISTENER):/py rpartapsing/dshpython3 python3 kafkaConsumerTenant.py

runall: chown runonce run listen
