Reference:  https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-10-on-ubuntu-20-04
Pre-requisite:
Please make sure Java is installed. 
sudo apt install default-jdk

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz
sudo tar -xvf apache-tomcat-10.0.20.tar.gz
sudo rm apache-tomcat-10.0.20.tar.gz
sudo mv apache-tomcat-10.0.20 tomcat
sudo chmod 777 -R /opt/tomcat
sudo chown liontechnologiessolutions -R /opt/tomcat
sh /opt/tomcat/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
echo "end on tomcat installation"
#========

#2. Start of tomcat configuration 


#Tomcat server configuration:
find / -name server.xml context.xml
vi /opt/tomcat/conf/server.xml
vi /opt/tomcat/webapps/manager/META-INF/context.xml
vi /opt/tomcat/conf/tomcat-user.xml  # to add user

	<user username="prince" password="admin" roles="manager-gui,admin-gui"/>
	

/opt/tomcat/conf/context.xml

 vi /opt/tomcat/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat/conf/tomcat-user.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
Finally access your server on :
localhost:8080.