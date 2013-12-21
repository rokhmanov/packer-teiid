export MAVEN_VERSION=3.0.4

echo "Pause for console output"
sleep 5

echo "Retrieve maven $MAVEN_VERSION binaries"
wget http://archive.apache.org/dist/maven/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz -C /usr/local
rm apache-maven-$MAVEN_VERSION-bin.tar.gz

echo "Populate Maven environment variables"
export PATH=\$PATH:/usr/local/apache-maven-$MAVEN_VERSION/bin
export M2_HOME=/usr/local/apache-maven-$MAVEN_VERSION

echo "Update profile with Maven variables"
echo export PATH=\$PATH:/usr/local/apache-maven-$MAVEN_VERSION/bin > /etc/profile.d/maven.sh
echo export M2_HOME=/usr/local/apache-maven-$MAVEN_VERSION >> /etc/profile.d/maven.sh

echo setenv PATH \${PATH}:/usr/local/apache-maven-$MAVEN_VERSION/bin > /etc/profile.d/maven.csh
echo setenv M2_HOME /usr/local/apache-maven-$MAVEN_VERSION >> /etc/profile.d/maven.csh
