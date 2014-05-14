VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "saucy64-java-node"
  config.vm.box_url = "http://191.236.23.180/azureuser/vagrant/saucy64-java-node.box"

  config.vm.network :forwarded_port, guest: 80, host: 8880
  config.vm.network :forwarded_port, guest: 8888, host: 8888

  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :info
    chef.add_recipe "sample-app"

    chef.json = { 
      :sample_app => {
        :name => "hello nurse"
      }
  }
  end
end