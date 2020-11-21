
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
  provisioner "shell"{
    execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'"
    script = "scripts/cleanup.sh"
  }
  post-processor "vagrant" {
    keep_input_artifact = true
    provider_override = "virtualbox"
    output = "builds/{{.Provider}}-centos8-2.box"
  }
#  provisioner "ansible"{
#      playbook_file = "../../playbook-base-configureation.yml"
#      galaxy_file = "../../roles/requirements.yml"
#      extra_arguments = [ "--extra-vars", "system_supporters=[\"vagrant\"]" ]
#
#  }
}
