# -*- mode: ruby -*-
# vi: set ft=ruby :

PATH_TO_WORKING_COPY = "~/Projects/VagrantLampDemo/src"

Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs-precise64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210-nocm.box"
  config.vm.hostname = "dev"
  config.vm.network :private_network, ip: "192.168.33.10"

  # VirtualBox Specific Customization
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.synced_folder PATH_TO_WORKING_COPY, "/var/www/html/vagrant-lamp-demo"
  
  # Enable shell provisioning
  config.vm.provision :shell, :path => "bootstrap.sh" 
end
