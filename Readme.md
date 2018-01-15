# DSH KPNQA Tenant

This contains all the code for the DSH KPN QA Tentant.

1. Clone this repo
2. cd into  DSH-TenantRest/dockerKJ 
3. execute: make
4. cd into main folder (DSH-TenantKPN) again
5. execute: make
6. execute: make runonce
7. Start up a kafka if not already there: execute: make runkafka
8. execute: make runall
9. execute: make open
10. Kafka GUI: make openkafka

The runall command will: 
* start up a listener which listens on topics created by tenants
on where the testresults are placed in json format.
* creates a topic "smashing" if not already there
* Puts the testresults on the smashing topic with as key the tenant.
* Runs jenkins server
* ensures docker.sock can be used (run docker inside docker)

All commands are run as deamon. For no deamon you may execute
"make runnod" and "make listennod"

In case of errors:
* Execute docker ps and check if dockers are not already running
"make stop" "make stopkafka"
* Go inside for e.g. the jenkins docker and check if the outside world can be accessed:
"docker exec -it dockerjk bash" "ping google.com" "curl <yourIPAddress>:3030"
* You may need to restart jenkins server: localhost:8084/restart. Press yes

## Clone from Jenkins backup
Overwrite the current JENKINS_HOME with a backup.
1. execute: docker exec -it dockerjk bash
2. cd into /var/jenkins_home (also cd ~)
3. try if you can ping the outside world (ping google.com)
4. git init ; git remote add backupJK https://github.com/RakiP/backupJK ; git clean -df; git clean -dn; git pull https://github.com/RakiP/backupJK
5. Exit docker to be in the same folder as the makefile again
6. execute: make chown
7. Browse to: localhost:8084/restart. press yes