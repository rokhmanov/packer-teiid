echo "Add repository and install java"
apt-get -y install python-software-properties
add-apt-repository -y ppa:webupd8team/java
apt-get -q -y update

echo "Accept license"
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get -y install oracle-java7-installer

echo "Update default java"
update-java-alternatives -s java-7-oracle

echo "Set environment variables"
apt-get install oracle-java7-set-default

echo "Check installation"
java -version
javac -version
