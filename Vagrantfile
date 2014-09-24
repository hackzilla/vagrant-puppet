Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  config.vm.network :forwarded_port, host: 5000, guest: 80
  config.vm.network :private_network, ip: "10.0.0.1"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.synced_folder ".", "/vagrant", nfs: true

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path = 'puppet/modules'
    puppet.manifest_file = 'init.pp'
  end

  config.dns.tld = "dev"
  config.dns.tlds = ["dev", "symfonylive"]
  config.vm.hostname = "symfonylive.dev"
  config.dns.patterns = [/^.*symfonylive.dev$/, /^.*symfonylive.ukwm150$/]

end

