VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.8.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
  end

  config.vm.define "deb" do |deb|
    deb.vm.hostname = "ansible-papertrail-deb"
    deb.vm.box = "ubuntu/xenial64"

    # Install python
    deb.vm.provision "install python", type: "shell" do |s|
      s.inline = "sudo apt-get update && sudo apt-get -y install python-minimal && export PYTHONUNBUFFERED=1"
    end

    # Run playbook
    deb.vm.provision "playbook", type: "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook.yml"
    end
  end

  config.vm.define "rhel" do |rhel|
    rhel.vm.hostname = "ansible-papertrail-rhel"
    rhel.vm.box = "generic/rhel7"

    # Run playbook
    rhel.vm.provision "playbook", type: "ansible" do |ansible|
      ansible.verbose = "v"
      ansible.playbook = "playbook.yml"
    end
  end
end
