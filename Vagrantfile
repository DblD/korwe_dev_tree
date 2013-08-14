Vagrant::Config.run do |config|
    # Bootstrap the VM
    config.vm.provision :shell, :path => './tools/bootstrap.sh'

    config.vm.box = "precise64-local"
    config.vm.forward_port 80, 3000
    config.vm.forward_port 9292,9292
    config.vm.forward_port 5672,5672

    config.vm.provision :shell do |shell|
        shell.inline = "mkdir -p /etc/puppet/modules;
        puppet mcdule install --force smarchive/gradle --version 0.1.2
        puppet module install --force puppetlabs/java
        puppet module install --force smarchive/archive"
    end
    
    config.vm.provision :puppet do |puppet|
        puppet.module_path = "./manifests/modules/"
    end

end
