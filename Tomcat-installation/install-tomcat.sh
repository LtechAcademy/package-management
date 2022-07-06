Reference:  https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-10-on-ubuntu-20-04
Pre-requisite:
Please make sure Java is installed. 
sudo apt install default-jdk #only if java is not installed
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.55/bin/apache-tomcat-9.0.55.tar.gz
sudo tar -xvf apache-tomcat-9.0.55.tar.gz
sudo rm apache-tomcat-9.0.55.tar.gz
sudo mv apache-tomcat-9.0.55 tomcat
sudo chmod 777 -R /opt/tomcat
sudo chmod 777 -R /opt/tomcat
sudo chown ubuntu -R /opt/tomcat
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
	
	<role rolename="manager-gui" />
<user username="dan" password="admin2022" roles="manager-gui" />

<role rolename="admin-gui" />
<user username="admin" password="admin_password" roles="manager-gui,admin-gui,manager-script" />
/opt/tomcat/conf/context.xml

 vi /opt/tomcat/webapps/manager/META-INF/context.xml
  
  vi /opt/tomcat/conf/tomcat-users.xml  # to add user
  
	
	username YourName password=PassWord   roles=manager-gui
	
	
Finally access your server on :
localhost:8080