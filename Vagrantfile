# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-6.5"
  config.ssh.username="root"
  config.ssh.username="vagrant"
  config.vm.provision "shell", inline: <<-SHELL
     sudo yum install -y install xz rpm-build yum-utils wget tar
     cd /vagrant
     make install
     make
   SHELL
end
