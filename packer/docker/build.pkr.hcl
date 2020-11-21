
build {
  sources = [
    "source.vagrant.centos8-docker",
    "source.vagrant.centos7-docker",
  ]
  provisioner "ansible"{
      playbook_file = "../../playbook-docker-configureation.yml"
      galaxy_file = "../../requirements.yml"
      extra_arguments = [ "--extra-vars", "system_supporters=[\"vagrant\"]" ]
      groups = ["dockerbased"]
  }
}
