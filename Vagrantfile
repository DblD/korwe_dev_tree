Vagrant::Config.run do |config|
    # Bootstrap the VM
    config.vm.provision :shell, :path => './tools/bootstrap.sh'

    config.vm.box = "precise64-local"
    config.vm.forward_port 80, 3000
    config.vm.forward_port 9292,9292
    
    config.vm.provision :puppet do |puppet|
        puppet.module_path = "./manifests/modules/"
    end

end
