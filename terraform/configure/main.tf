# https://nicholasbering.ca/tools/2018/01/08/introducing-terraform-provider-ansible/
module "ansible_local_dependencies" {
  source    = "github.com/cloudposse/tf_ansible"
  playbook  = "${path.module}/../../ansible/playbook-util-ansible-setup.yml"
  dry_run   = false
}

module "ansible_provisioner" {
  source    = "github.com/cloudposse/tf_ansible"
  arguments = ["-i ${var.ansible_inventory_path}", "--extra-vars ${jsonencode(var.extraVars)}"]
  playbook  = "${path.module}/../../ansible/master-configure-system.yml"
  dry_run   = false
}
