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
sudo mv /opt/nexus-3.39.0-01 /opt/nexus
#As security practice, not to run nexus service using root user, so lets create new user named nexus to run nexus service
sudo adduser nexus  #this creates a user called nexus
#add nexus to sudoers groups
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
#Give permission to nexus files and nexus directory to nexus user
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
#To run nexus as service at boot time, open /opt/nexus/bin/nexus.rc file, uncomment it and add nexus user as shown below
sudo vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"
#Create softlink for nexus file:
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
Login to nexus user:
su - nexus
#Start nexus:
service nexus start
#Check status of nexus:
service nexus status

#5: Access Nexus Repository Web Interface
sudo ufw allow 22/tcp
localhost:8081
Initial  user: admin 
#password : run this command to get password:   cat /opt/sonatype-work/nexus3/admin.password
vi setting.xml 



<server>
<id>nexus</id>
<username>admin</username>
<password>Zion2020</password>
</server>

 tag name </settings> must match start tag name <servers> from line 111 (position: TEXT seen ...</servers>\r\n</settings>... @264:12)  @ /opt/maven/conf/settings.xml, line 264, column 12



