------------------ NEXUS INSTALLATION  ----------------------
Prerequisites:
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz

tar -xf latest-unix.tar.gz

cd nexus
cd bin/

chmod +x nexus

./nexus start

Open a web browser and navigate to http://localhost:8081. This is the default URL for accessing Nexus.
cat /home/ubuntu/sonatype-work/nexus3/admin.password

------------------------------OR ELSE DIRECTLY ------------------------------------------------

Install Nexus using Docker
docker run -d --name nexus -p 8081:8081 sonatype/nexus3
