Vagrant.configure("2") do |config|

  servers=[
    {
	  :hostname => "db",
	  :box => "debian/bullseye64",
	  :ip => "192.168.33.11",
	  :provision_path => "./provision/setupdb.sh"
	},
	{
	  :hostname => "web",
	  :box => "debian/bullseye64",
	  :ip => "192.168.33.10",
	  :provision_path => "./provision/setupweb.sh"
	}
  ]
	
  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
	    node.vm.hostname = machine[:hostname]
		node.vm.box = machine[:box]
		node.vm.network "private_network", ip: machine[:ip]

		node.vm.provider "virtualbox" do |vm|
			vm.name = machine[:hostname]
			vm.gui = false
			vm.memory = "1024"
			# v.cpus = 2
		end

		node.vm.provision "shell" do |s|
			s.path = machine[:provision_path]
		end
	end
  end
end
