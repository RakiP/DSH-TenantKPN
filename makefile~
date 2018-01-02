build:
	@docker build -t dockerjk --network=host .

run:
	@docker-compose up -d

runnod:
	@docker-compose up

stop:
	@docker stop dockerjk

chown:
	@chmod 666 /var/run/docker.sock
