echo "Apply settings.xml from Teiid"
mkdir /home/vagrant/.m2
cp /tmp/files/settings.xml /home/vagrant/.m2/settings.xml

echo "Checkout Teiid sources"
mkdir git
cd git
git clone https://github.com/teiid/teiid.git
