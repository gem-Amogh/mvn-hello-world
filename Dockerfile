FROM tomcat:9.0-jdk11-openjdk

# Remove the default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file to the webapps directory
COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8083
