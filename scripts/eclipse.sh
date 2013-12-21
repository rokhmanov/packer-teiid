export ECLIPSE_VERSION=kepler-SR1

echo "Retrieve Eclispe distribution"
wget http://download.eclipse.org/technology/epp/downloads/release/kepler/SR1/eclipse-standard-$ECLIPSE_VERSION-linux-gtk-x86_64.tar.gz
tar -xvzf eclipse-standard-$ECLIPSE_VERSION-linux-gtk-x86_64.tar.gz -C /usr/local
rm eclipse-standard-$ECLIPSE_VERSION-linux-gtk-x86_64.tar.gz
chmod -R +r /usr/local/eclipse
echo export PATH=\$PATH:/usr/local/eclipse > /etc/profile.d/eclipse.sh
echo setenv PATH \${PATH}:/usr/local/eclipse > /etc/profile.d/eclipse.csh

echo "Generate Desktop launcher"
mkdir /home/vagrant/Desktop/
cat <<EOF >/home/vagrant/Desktop/eclipse.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Eclipse $ECLIPSE_VERSION
Exec=/usr/local/eclipse/eclipse 
Icon=/usr/local/eclipse/icon.xpm
Terminal=false
EOF
chmod +rwx /home/vagrant/Desktop/eclipse.desktop
chown -R vagrant:vagrant /home/vagrant/Desktop

echo "Update eclipse.ini"
sed -i -e 's/-XX:MaxPermSize=256m/-XX:MaxPermSize=512m/g' /usr/local/eclipse/eclipse.ini
sed -i -e 's/-Xms40m/-Xms1024m/g' /usr/local/eclipse/eclipse.ini
sed -i -e 's/-Xmx512m/-Xmx2550m/g' /usr/local/eclipse/eclipse.ini

echo "Create workspace"
unzip /tmp/files/workspace.zip

echo "Pause for console output"
sleep 5