Ref:  https://www.howtoforge.com/how-to-install-and-configure-nexus-repository-manager-on-ubuntu-20-04/

How to Install Nexus Repository on Ubuntu 20.04 LTS:
update the system packages:
 sudo apt-get update
 #1: Install OpenJDK 1.8 on Ubuntu
 
 sudo apt install openjdk-8-jdk  #if you have maven installed , please ignore
#2: Download Nexus Repository Manager setup on Ubuntu 20.04 LTS
Navigate to /opt directory
cd /opt
#Download the SonaType Nexus on Ubuntu using wget
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
#3: Install Nexus Repository on Ubuntu 20.04 LTS
#Extract the Nexus repository setup in /opt directory
sudo tar -zxvf latest-unix.tar.gz
#Rename the extracted Nexus setup folder to nexus
sudo mv /opt/nexus-3.40.1-01 /opt/nexus
#As security practice, not to run nexus service using root user, so lets create new user named nexus to run nexus service
sudo adduser nexus  #this creates a user called nexus
#add nexus to sudoers groups
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
#Give permission to nexus files and nexus directory to nexus user
#5 Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.


sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work

#6 Open /opt/nexus/bin/nexus.rc file and  uncomment run_as_user parameter and set as nexus user.

vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"

#7 CONFIGURE NEXUS TO RUN AS A SERVICE 

sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

#9 Enable and start the nexus services
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus
echo "end of nexus installation"

=====================
access nexus on the browser
34.229.62.93:8081
userName  --- ADMIN
Password   ADMIN123
