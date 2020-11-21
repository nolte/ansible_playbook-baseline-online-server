source "virtualbox-iso" "centos8" {
  boot_command = [
    "<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>",
  ]
  boot_wait = "10s"
  disk_size = 81920
  guest_additions_path = "VBoxGuestAdditions_{{.Version}}.iso"
  guest_os_type = "RedHat_64"
  headless = true
  http_directory = "http"
  iso_checksum = "sha256:c87a2d81d67bbaeaf646aea5bedd70990078ec252fc52f5a7d65ff609871e255"
  iso_urls = [
    "CentOS-8.2.2004-x86_64-dvd1.iso",
    "http://mirror.mobap.edu/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso",
  ]
  shutdown_command = "echo 'vagrant'|sudo -S /sbin/halt -h -p"
  ssh_password = "vagrant"
  ssh_port = 22
  ssh_username = "vagrant"
  ssh_wait_timeout = "1800s"
  vboxmanage = [
    [
      "modifyvm",
      "{{.Name}}",
      "--memory",
      "2048",
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--cpus",
      "1",
    ],
  ]
  virtualbox_version_file = ".vbox_version"
  vm_name = "packer-centos-8-2-x86_64"
}

#source "vagrant" "centos8" {
#  communicator = "ssh"
#  iso_url = "https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Vagrant-8.2.2004-20200611.2.x86_64.vagrant-virtualbox.box"
#  source_path = "centos/8"
#  #source_path = "bento/8"
#  provider = "virtualbox"
#  add_force = true
#  output_dir = "/tmp/dist/basement/centos8"
#}
#source "vagrant" "centos7" {
#  communicator = "ssh"
#  source_path = "centos/7"
#  provider = "virtualbox"
#  add_force = true
#  output_dir = "/tmp/dist/basement/centos7"
#}
