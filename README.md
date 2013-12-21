Packer Template for JBoss Teiid Development
===========================================

The template used to generate the [VirtualBox](http://virtualbox.org) image based on latest Ubuntu LTS (ubuntu-12.04.3-desktop-amd64).
Image includes:
* Oracle Java 7 (1.7.0_45-b18)
* Apache Maven 3.0.4
* Eclipse Kepler SR1
* JBoss EAP-6.1.0.Alpha
* Teiid 8.6.0.Final
* Latest Teiid sources (8.7.0.Alpha1-SNAPSHOT at this moment);

### Pre-requisites:
* [Oracle VM VirtualBox](http://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)
* [Packer](http://www.packer.io)

### Usage

1. Generate Vagrant Box from Template:

```
packer build ubuntu-12.04.3-desktop-amd64.json 
```

2. Import generated Box into Vagrant repository:

```
vagrant box add ubuntu-12.04.3-desktop-amd64 ubuntu-12.04.3-desktop-amd64.box 
```

3. Start Vagrant box (use existing Vagrantfile)

```
vagrant up ubuntu-12.04.3-desktop-amd64

```

4. Stop Vagrant box

```
vagrant suspend ubuntu-12.04.3-desktop-amd64

```

### Additional Notes

User credentials - l:vagrant, p:vagrant
Root password: not set
SSH port to connect from Host: localhost:2222
Guest mounted directory: /vagrant

To compile Teiid sources: 

```
cd /home/vagrant/git/teiid
mvn clean install -P release
```
