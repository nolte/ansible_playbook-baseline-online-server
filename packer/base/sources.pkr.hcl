source "vagrant" "centos8" {
  communicator = "ssh"
  iso_url = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Vagrant-8.2.2004-20200611.2.x86_64.vagrant-virtualbox.box"
  source_path = "centos/8"
  #source_path = "bento/8"
  provider = "virtualbox"
  add_force = true
  output_dir = "/tmp/dist/basement/centos8"
}
source "vagrant" "centos7" {
  communicator = "ssh"
  source_path = "centos/7"
  provider = "virtualbox"
  add_force = true
  output_dir = "/tmp/dist/basement/centos7"
}
