terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
    }
    pass = {
      source = "camptocamp/pass"
    }
  }
}
