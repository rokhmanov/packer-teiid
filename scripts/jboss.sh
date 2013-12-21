export JBOSS_VERSION=eap-6.1.0
export JBOSS_TAG=Alpha
export TEIID_VERSION=8.6.0.Final

echo export JBOSS_VERSION=$JBOSS_VERSION >> /etc/profile.d/jboss.sh
echo export JBOSS_TAG=$JBOSS_TAG >> /etc/profile.d/jboss.sh
echo export TEIID_VERSION=$TEIID_VERSION >> /etc/profile.d/jboss.sh

echo setenv JBOSS_VERSION $JBOSS_VERSION >> /etc/profile.d/jboss.csh
echo setenv JBOSS_TAG $JBOSS_TAG >> /etc/profile.d/jboss.csh
echo setenv TEIID_VERSION $TEIID_VERSION >> /etc/profile.d/jboss.csh


echo "Installing JBoss"
wget http://download.jboss.org/jbosseap/6/jboss-eap-6.1.0.Alpha/jboss-$JBOSS_VERSION.$JBOSS_TAG.zip 
unzip jboss-$JBOSS_VERSION.$JBOSS_TAG.zip
rm jboss-$JBOSS_VERSION.$JBOSS_TAG.zip
mv jboss* /usr/local/jboss-$JBOSS_VERSION


echo "Installing Teiid"
wget -O teiid.zip https://sourceforge.net/projects/teiid/files/teiid-$TEIID_VERSION-jboss-dist.zip/download
unzip teiid.zip -d /usr/local/jboss-$JBOSS_VERSION
rm teiid.zip

echo "Apply configuration and permissions"
ln -s /usr/local/jboss-$JBOSS_VERSION Desktop/jboss-$JBOSS_VERSION
chown -R vagrant /usr/local/jboss-$JBOSS_VERSION
