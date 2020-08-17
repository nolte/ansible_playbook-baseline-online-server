
build {
  sources = [
    "source.vagrant.centos8",
    "source.vagrant.centos7",
  ]
  provisioner "ansible"{
      playbook_file = "../../playbook-base-configureation.yml"
      galaxy_file = "../../requirements.yml"
      extra_arguments = [ "--extra-vars", "system_supporters=[\"vagrant\"]" ]

  }
}
