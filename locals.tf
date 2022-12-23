locals {
  public_pgsql_admin_login = "psqladmin${random_password.pgsql_admin_login.result}"

  shared_galleries = {
    "dev" = {
      description = "Shared images built by pull requests in jenkins-infra/packer-images (consider it untrusted)."
      rg_location = "eastus"
      images_location = {
        "ubuntu-20"    = "eastus"
        "ubuntu-20.04" = "eastus"
        "windows-2019" = "eastus"
        "windows-2022" = "eastus"
      }
    }
    "staging" = {
      description = "Shared images built by the principal code branch in jenkins-infra/packer-images (ready to be tested)."
      rg_location = "eastus"
      images_location = {
        "ubuntu-20"    = "eastus2"
        "ubuntu-20.04" = "eastus"
        "windows-2019" = "eastus2"
        "windows-2022" = "eastus"
      }
    }
    "prod" = {
      description = "Shared images built by the releases in jenkins-infra/packer-images (⚠️ Used in production.)."
      rg_location = "eastus2"
      images_location = {
        "ubuntu-20"    = "eastus2"
        "ubuntu-20.04" = "eastus"
        "windows-2019" = "eastus"
        "windows-2022" = "eastus"
      }
    }
  }

  admin_allowed_ips = {
    dduportal          = "109.88.253.68"
    dduportal-travel   = "86.194.33.212"
    lemeurherve        = "176.185.227.180"
    smerle33           = "82.64.5.129"
  }

  # TODO: remove when switching infra.ci.jenkins.io from temp-privatek8s to privatek8s
  temp_privatek8s_pod_ip = "20.72.105.159"

  default_tags = {
    scope      = "terraform-managed"
    repository = "jenkins-infra/azure"
  }
}
