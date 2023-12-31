##################----INSTALL TOMCAT----##################

/opt sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
sudo tar -xvf apache-tomcat-9.0.65.tar.gz

cd /opt/apache-tomcat-9.0.65/conf
sudo vi tomcat-users.xml
---add-below-line at the end (2nd-last line)----
<user username="admin" password="admin1234" roles="admin-gui, manager-gui"/>



sudo ln -s /opt/apache-tomcat-9.0.65/bin/startup.sh /usr/bin/startTomcat
sudo ln -s /opt/apache-tomcat-9.0.65/bin/shutdown.sh /usr/bin/stopTomcat



sudo vi /opt/apache-tomcat-9.0.65/webapps/manager/META-INF/context.xml
comment:
  <!-- Valve className="org.apache.catalina.valves.RemoteAddrValve"
  allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
  
sudo vi /opt/apache-tomcat-9.0.65/webapps/host-manager/META-INF/context.xml
comment:
  <!-- Valve className="org.apache.catalina.valves.RemoteAddrValve"
  allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->

sudo stopTomcat
sudo startTomcat

####### after started tomcat go to opt and give one permision
 chmod -R 757 apache-tomcat-9.0.65

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

To Build and run an project/application
mvn clean package

then go to target folder in that war file is generated
projectname.war
pwd
/home/ubuntu/Petclinic/target

-----------------open another server and do thi steps----------------------
root@ip-172-31-52-41:~# cd /opt
root@ip-172-31-52-41:/opt# ls
apache-tomcat-9.0.65  apache-tomcat-9.0.65.tar.gz
root@ip-172-31-52-41:/opt# cd apache-tomcat-9.0.65
root@ip-172-31-52-41:/opt/apache-tomcat-9.0.65# ls
BUILDING.txt  CONTRIBUTING.md  LICENSE  NOTICE  README.md  RELEASE-NOTES  RUNNING.txt  bin  conf  lib  logs  temp  webapps  work
root@ip-172-31-52-41:/opt/apache-tomcat-9.0.65# cd webapps/
root@ip-172-31-52-41:/opt/apache-tomcat-9.0.65/webapps# ls
ROOT  docs  examples  host-manager  manager
root@ip-172-31-52-41:/opt/apache-tomcat-9.0.65/webapps# pwd
/opt/apache-tomcat-9.0.65/webapps

 after this steps in first server
 cd ..
cp /home/ubuntu/Petclinic/target/petclinic.war /opt/apache-tomcat-9.0.65/webapps/ 
then copy ip address and port number 8080 paste in browser then project will be open in server


-------------------------------------------------------------------------------------------------------------------------------------------------------
if we want to run apache as any user we use command
sudo chmod -R ubuntu apache-tomcat-9.0.65
