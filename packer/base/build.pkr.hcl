
build {
  sources = [
    "sources.virtualbox-iso.centos8",
  ]

  provisioner "shell"{
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "scripts/ansible.sh"
  }
  provisioner "ansible-local"{
    playbook_dir = "../../ansible/"
    playbook_file = "../../ansible/playbook-util-ansible-setup.yml"
  }
  provisioner "ansible-local"{
    playbook_dir = "../../ansible/"
    playbook_file = "../../ansible/playbook-base-configuration.yml"
    inventory_file =  "scripts/ansibe-packer-inventory"
    extra_arguments = ["--extra-vars", "'{ \"system_supporters\": [\"vagrant\"], \"sshd_PasswordAuthentication\":\"yes\" }'"]
  }  
  provisioner "shell"{
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "scripts/cleanup.sh"
  }
  #provisioner "shell" {
  #    inline = ["firewall-cmd --zone=public --add-port=2222/tcp --permanent && firewall-cmd --reload"]
  #}
  post-processor "vagrant" {
    keep_input_artifact = true
    provider_override = "virtualbox"
    output = "builds/{{.Provider}}-centos8.box"
  }
}
