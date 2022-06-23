Reference:  https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-9-on-ubuntu-20-04
Pre-requisite:
Please make sure Java is installed. 
cd /opt 
sudo apt install default-jdk
#[To uninstall Java :  sudo apt-get purge openjdk-\*]
sudo wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.10/bin/apache-tomcat-10.0.10.tar.gz
sudo tar -xvf apache-tomcat-10.0.10.tar.gz
sudo rm apache-tomcat-10.0.10.tar.gz
sudo mv apache-tomcat-10.0.10 tomcat
sudo chmod 777 -R /opt/tomcat
sudo chown liontechsolutions -R /opt/tomcat 
sh /opt/tomcat/bin/startup.sh
export JAVA_HOME=/usr/bin/java
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
stoptomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 


#Tomcat server configuration:
find / -name server.xml context.xml
vi /opt/tomcat/conf/server.xml
vi /opt/tomcat/webapps/manager/META-INF/context.xml
vi /opt/tomcat/conf/tomcat-user.xml  # to add user

	<role rolename="manager-gui" />
<user username="ltech" password="admin123" roles="manager-gui" />

<role rolename="admin-gui" />
<user username="admin" password="admin123" roles="manager-gui,admin-gui" />
	#<user username="prince" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat/conf/context.xml

 vi /opt/tomcat/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
Finally access your server on :
sudo ufw allow 8080/tcp

localhost:8080