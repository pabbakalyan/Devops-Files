Installation jenkins 

sudo yum update
cd /opt
sudo yum install git -y

Installation java
sudo yum install amazon-linux-extras
sudo amazon-linux-extras install java-openjdk11

Installation Maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip
unzip apache-maven-3.9.4-bin.zip 
mv apache-maven-3.9.4 maven
sudo yum install maven -y

cd /etc/profile.d
vim profile.d
export M2_HOME=/opt/maven
export PATH=${M2_HOME}/bin:${PATH}
source maven.sh

Installation Jenkins 

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum install jenkins -y

systemctl enable jenkins
systemctl start jenkins

In oTher way

jenkins . war file
wget https://updates.jenkins.io/download/war/2.387.3/jenkins.war
java -jar jenkins.war --httpPort=8082
