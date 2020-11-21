# Terraform Ansible wrapper

Use [cloudposse/terraform-null-ansible](https://github.com/cloudposse/terraform-null-ansible) as wrapper for bootstrap Machines with Ansible, from Terraform sources. More informations at
[nicholasbering.ca](https://nicholasbering.ca/tools/2018/01/08/introducing-terraform-provider-ansible/)


## Usage



```hcl

module "bootstrap" {
    source = ""
    ...
}

```
