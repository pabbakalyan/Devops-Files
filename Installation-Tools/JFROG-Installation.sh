First we need to install Docker and then execute  bellow commands

sudo usermod -aG docker $USER
docker pull docker.bintray.io/jfrog/artifactory-oss:latest
sudo mkdir -p /jfrog/artifactory
sudo chown -R 1030 /jfrog/
docker run --name artifactory -d \
  -p 8081:8081 \
  -p 8082:8082 \
  -v /jfrog/artifactory:/var/opt/jfrog/artifactory \
  docker.bintray.io/jfrog/artifactory-oss:latest
--------------------------------------------------------------------------------------------------------------------
                                              OR
--------------------------------------------------------------------------------------------------------------------
prerequisites for JFrog

small or medium instance t2 ytpe
2cpus
8081 and 8082 and ssh ports
openjdk 11

==> $ sudo apt update
First of all add the GPG key by entering the following command.
==> sudo apt install default-jre

==> $ wget -qO - https://api.bintray.com/orgs/jfrog/keys/gpg/public.key | sudo apt-key add -
Add jfrog repository in your apt list. Just copy and paste the following command in your terminal.

==> $ echo "deb https://jfrog.bintray.com/artifactory-debs bionic main" | sudo tee /etc/apt/sources.list.d/jfrog.list
Let’s then update apt index,

==> $ sudo apt update
Now, you can install using jfrog service by entering the following command.

==> $ sudo apt install jfrog-artifactory-oss
Start the service,

==> $ sudo systemctl start artifactory.service
Enable the service,


==> $ sudo systemctl enable artifactory.service
Check the status of service

==> $ systemctl status artifactory.service

Access Jfrog UI
Open your browser and enter http://IP_or DOMAIN-NAME:8081/artifactory

Use default username and password to loging.
admin
password

You need to reset the admin password.

Setup the base URL, like your domain name to access the JFrog artifactory web UI. You can skip if you don’t have any.

Now, the next step is to configure the default proxy. If your enterprise has a proxy gateway for accessing the server, use it otherwise skip it.

Now your installation and basic configuration is finished. You can start creating a repository based on your project.
