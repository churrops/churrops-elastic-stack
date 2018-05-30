VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "centos/7"
    config.vm.hostname = "elasticsearch"

    config.vm.network :forwarded_port, host: 9200, guest: 9200, auto_correct: true # website
    config.vm.network :private_network, ip: "10.0.0.10"

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.customize ['modifyvm', :id, '--memory', '1024']
        vb.customize ["modifyvm", :id, "--cpus", "1"]
        vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    end

  config.vm.provision "ansible" do |ansible|
         ansible.name = 'Elasticsearch' 
         ansible.playbook = 'ansible/pb_elasticsearch-master.yml'
         ansible.inventory_path = 'ansible/hosts'
         ansible.limit = 'all'
         ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
         ansible.verbose = 'vvv'
  end
end
