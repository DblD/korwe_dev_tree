Vagrant::Config.run do |config|
    config.vm.box = "precise64"
    config.vm.forward_port 80, 3000
    
    config.vm.provision :puppet do |puppet|
        puppet.module_path = "./manifests/modules/"
    end

end
