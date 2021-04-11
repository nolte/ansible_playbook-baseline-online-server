
resource "awx_project" "this" {
  name                 = "base-service-configuration"
  scm_type             = "git"
  scm_url              = "https://github.com/nolte/ansible_playbook-baseline-online-server"
  scm_branch           = var.scm_branch
  scm_update_on_launch = true
  organisation_id      = var.organisation_id
}

output "this" {
  value = awx_project.this
}
