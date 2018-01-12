LISTENER:=PATHTOLISTENER
IPREAL:=IPADDRESS

build:
	@cd jenkins && docker build -t dockerjk --network=host .

run:
	@cd jenkins && docker-compose up -d

runnod:
	@cd jenkins && docker-compose up

stop:
	@cd jenkins && docker stop dockerjk

chown:
	@sudo chmod 777 /var/run/docker.sock

runonce:
	@sudo chmod 777 changeme.sh && ./changeme.sh

open:
	open -a "Google Chrome" http://localhost:8084

openKafka:
	open -a "Google Chrome" http://localhost:3030

openGit:
	open -a "Google Chrome" https://git.kpn.org/projects/TQR

stopkafka:
	@docker stop dkafka

runkafka:
	@docker run --rm -d -p 2181:2181 -p 3030:3030 -p 8081:8081 -p 8082:8082 -p 8083:8083 -p 9092:9092 --net=host -e ADV_HOST=$IPREAL --name dkafka landoop/fast-data-dev

listen:
	@docker run -ti --rm -d -v $(LISTENER):/py dockerkj python3 kafkaConsumerTenant.py

listennod:
	@docker run -ti --rm -v $(LISTENER):/py dockerkj python3 kafkaConsumerTenant.py

runall: chown run listen
