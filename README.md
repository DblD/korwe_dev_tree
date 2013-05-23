korwe_dev_tree
==============

playing around with vagrant and puppet provisioning 

Prerequisits :

	VirtualBox
	https://www.virtualbox.org/wiki/Downloads
	
	Vagrant 
	http://downloads.vagrantup.com/tags/v1.2.2

Get and install virtual box and vagrant:


Add Vagrant starter box from korwe network:

	vagrant box add precise64-local http://korwe.dnsalias.com/vagrant/precise64-local.box

Start and provision box :
	
	vagrant up
