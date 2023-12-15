******* When ever we are create an VM first step is update the VM 
sudo apt-get update -y

To Install Maven in VM
sudo apt install maven -y

To check  the version of maven
mvn -version

To generate a java based project we use maven to build the project 
To build the project

2) change directory to opt and install maven
3) go to etc directory and search for profile.d directory
4) in that create one script file maven.sh
5) in that file give environment variables
export M2_HOME=/opt/maven
 export PATH=${M2_HOME}/bin:${PATH}
6) then run that script using filename.sh
7) now generate java project using mvn archetype:generate

