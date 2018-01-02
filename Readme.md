1. Create a folder for testing purposes
2. git clone https://github.com/RakiP/DSH-TenantKPN.git
3. cd into DSH-TenantKPN; sudo make install
4. sudo make
5. sudo make run (if error, maybe another jenkins is running, just start that one up: sudo docker start dockerjk)
6. Open localhost:8084. Now let's get the JENKINS_HOME backup from git.
7. go inside docker : sudo docker exec -it dockerjk bash. cd into /var/jenkins_home
8. try if you can ping the outside world (ping google.com)
9. git init ; git remote add backupJK https://github.com/RakiP/backupJK ; git clean -df; git clean -dn; git pull https://github.com/RakiP/backupJK
10. Exit docker to be in the same folder as the makefile again.
11. sudo make chown
12. Goto localhost:8084/restart. press yes
13. Execute run-kafka
  if error go back to terminal and execute "sudo make stopkafka"
14. sudo make listen

15. cd .. (back in folder from 1.)
16. git clone https://github.com/RakiP/DSH-Smashing.git
17. cd into DSH-Smashing, sudo make.
  if you change 16. (url of git), then change in dockerfile this url in the RUN command. So open the dockerfile to see what needs to be changed.
18. sudo make run
19. sudo make listen
20. Open localhost:5000

21. Upload your tests into a git repo. Make sure the master has two folders: Testcases, Testresults. Inside Testcases there are folders for each test-area
example: https://github.com/RakiP/Testcases.git
22. cd .. (back in folder from 1.)
23. git clone https://github.com/RakiP/DSH-TenantRest.git
24. cd into DSH-TenantRest; sudo make 
25. sudo make listen
26. sudo make jenkins
27. fill in the fields...

if Mount test does not run:
* go into DSH-TenantRest/templaes. nano push-mountedDisk.xml and change the IP-address to the one from your laptop, use ifconfig for that. If it still doesn't work, check if you can ping from within the jenkins container.
