# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	# use different plugins when behind a proxy
	if ENV['http_proxy'].nil? || ENV['http_proxy'] == ""
		required_plugins = %w( vagrant-vbguest vagrant-disksize )
	else
    	required_plugins = %w( vagrant-vbguest vagrant-disksize vagrant-proxyconf )  
	end

    _retry = false
    required_plugins.each do |plugin|
        unless Vagrant.has_plugin? plugin
            system "vagrant plugin install #{plugin}"
            _retry=true
        end
    end	
	
    if Vagrant.has_plugin?("vagrant-vbguest")
        config.vbguest.auto_update = false
    end

    if Vagrant.has_plugin?("vagrant-disksize")
        config.disksize.size = '15GB'
    end

    if Vagrant.has_plugin?("vagrant-proxyconf")
        # let CNTLM listen on the vboxnet interface, set your localhost
        # as the proxy for VirtualBox machines, so APT can get through
		# note: the host is exposed to guests as 10.0.2.2; no need to bind
		# CNTLM to any other NIC, 127.0.0.1 is sufficient.
        config.proxy.http     = "http://10.0.2.2:3128/"
        config.proxy.https    = "http://10.0.2.2:3128/"
        config.proxy.no_proxy = "localhost,127.0.0.1,10.,192.168.,.example.com"
    end



    config.vm.box = "ubuntu/bionic64"
    config.vm.hostname = "devstack"
    config.vm.define "devstack"
    config.vm.box_check_update = false
	#config.vm.network "forwarded_port", guest: 80, host: 8080 # horizon
	#config.vm.network "private_network", type: "dhcp"
    #config.vm.network "private_network", ip: "192.168.56.3"
    config.vm.provider "virtualbox" do |vb|
        vb.name = "devstack"
        vb.memory = "4096"
        vb.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ]
    end
    config.vm.provision "shell" do |sh|
        sh.path = "bootstrap.sh"
	    sh.privileged = false
	    # JDK version, can be one or more of 8 and 10; the last one is set as default
        # sh.args = ["8", "10"] 
    end  

end
