source "vagrant" "centos8-docker" {
  communicator = "ssh"
  iso_url = "/tmp/dist/basement/centos8/package.box"
  source_path = "centos/8"
  provider = "virtualbox"
  add_force = true
  output_dir = "/tmp/dist/docker/centos8"
}
source "vagrant" "centos7-docker" {
  communicator = "ssh"
  iso_url = "/tmp/dist/basement/centos7/package.box"
  source_path = "centos/8"
  provider = "virtualbox"
  add_force = true
  output_dir = "/tmp/dist/docker/centos7"
}
