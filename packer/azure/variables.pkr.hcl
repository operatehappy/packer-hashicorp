# This file is automatically loaded by Packer

# If you do not wish to use credentials supplied through the `az` CLI, set `use_azure_cli_auth` to false
# and enable the variables for `subscription_id`, `client_id`, and `client_secret`
# Then, move `credentials.auto.pkrvars.hcl.sample` to `azure-credentials.auto.pkrvars.hcl` and populate it.

# see https://www.packer.io/docs/builders/azure/arm#subscription_id
#variable "subscription_id" {
#  type        = string
#  description = "Subscription under which the build will be performed."
#}

# see https://www.packer.io/docs/builders/azure/arm#client_id
#variable "client_id" {
#  type        = string
#  description = "The Active Directory service principal associated with your builder."
#}

# see https://www.packer.io/docs/builders/azure/arm#client_secret
#variable "client_secret" {
#  type        = string
#  description = "The password or secret for your service principal."
#
#  # sensitive values are hidden from outputs
#  sensitive = true
#}

# see https://www.packer.io/docs/builders/azure/arm#azure_tags
variable "azure_tags" {
  type        = map(string)
  description = "Name/value pair tags to apply to every resource deployed."
  default     = {}
}

# see https://www.packer.io/docs/builders/azure/arm#cloud_environment_name
variable "cloud_environment_name" {
  type        = string
  description = "Specify a Cloud Environment Name."
  default     = "Public"
}

# see https://www.packer.io/docs/builders/azure/arm#custom_data_file
variable "custom_data_file" {
  type        = string
  description = "Specify a file containing custom data to inject into the cloud-init process."
  default     = ""
}

# see https://www.packer.io/docs/builders/azure/arm#image_publisher
variable "image_publisher" {
  type        = string
  description = "(Required) Name of the publisher to use for your base image."
  default     = "Canonical"
}

# see https://www.packer.io/docs/builders/azure/arm#image_offer
variable "image_offer" {
  type        = string
  description = "(Required) Name of the publisher's offer to use for your base image."
  default     = "0001-com-ubuntu-server-focal"
}

# see https://www.packer.io/docs/builders/azure/arm#image_sku
variable "image_sku" {
  type        = string
  description = "(Required) SKU of the image offer to use for your base image."
  default     = "20_04-lts"
}

# see https://www.packer.io/docs/builders/azure/arm#image_version
variable "image_version" {
  type        = string
  description = "Specify a specific version of an OS to boot from."
  default     = "latest"
}

# see https://www.packer.io/docs/builders/azure/arm#location
variable "location" {
  type        = string
  description = "Azure datacenter in which your VM will build."

  # The default for this is specified in `./generated.auto.pkrvars.hcl`
}

# see https://www.packer.io/docs/builders/azure/arm#managed_image_name
variable "managed_image_name" {
  type        = string
  description = "Name to use for the image."
  default     = ""
}

variable "managed_image_version" {
  type        = string
  description = "Version to use for the image."
  default     = ""
}

# see https://www.packer.io/docs/builders/azure/arm#vm_size
variable "vm_size" {
  type        = string
  description = "Size of the VM used for building."
  default     = "Standard_A1"
}

# see https://www.packer.io/docs/builders/azure/arm#managed_image_resource_group_name
variable "managed_image_resource_group_name" {
  type        = string
  description = "Resource group under which the final artifact will be stored."

  # The default for this is specified in `./generated.auto.pkrvars.hcl`
}

# see https://www.packer.io/docs/builders/azure/arm#os_type
variable "os_type" {
  type        = string
  description = "OS Type to use for configuration of authentication credentials."
  default     = "Linux"
}

# shared configuration
variable "shared" {
  type = object({
    enable_debug_statements = bool
    enable_post_validation  = bool

    ansible = object({
      ansible_env_vars = list(string)
      command          = string
      extra_arguments  = list(string)
      galaxy_file      = string
      playbook_file    = string
    })

    checksum_output = string
    checksum_types  = list(string)

    communicator = object({
      ssh_clear_authorized_keys    = bool
      ssh_disable_agent_forwarding = bool
      ssh_username                 = string
      type                         = string
    })

    docker = object({
      enabled = bool

      packages = list(object({
        name    = string
        version = string
      }))

      repository = object({
        keyring = string
        url     = string
      })

      toggles = map(bool)
    })

    generated_files = object({
      configuration = string
      versions      = string
    })

    hashicorp = object({
      enabled          = bool
      enabled_products = map(bool)

      nomad_plugins = list(object({
        name    = string
        version = string
      }))

      packages = list(object({
        name    = string
        version = string
      }))

      repository = object({
        url = string
      })

      toggles = map(bool)
    })

    image_version_date_format     = string
    image_information_date_format = string

    inspec = object({
      attributes           = list(string)
      attributes_directory = string
      backend              = string
      command              = string
      inspec_env_vars      = list(string)
      profile              = string
      user                 = string
    })

    name = string

    os = object({
      enabled = bool

      directories = object({
        ansible   = list(string)
        to_remove = list(string)
      })

      packages = object({
        to_install = list(string)
        to_remove  = list(string)
      })

      shell_helpers = object({
        destination = string
        base_url    = string
        helpers     = list(string)
      })

      toggles = map(bool)
    })

    osquery = object({
      enabled = bool

      packages = list(object({
        name    = string
        version = string
      }))

      paths = list(string)

      repository = object({
        key        = string
        key_server = string
        url        = string
      })

      toggles = map(bool)
    })

    podman = object({
      enabled = bool

      packages = list(object({
        name    = string
        version = string
      }))

      repository = object({
        url = string
      })

      toggles = map(bool)
    })

    prompt = object({
      enabled = bool
    })

    templates = object({
      configuration = string
      versions      = string
    })
  })

  description = "Shared Configuration for all Images"

  # The default for this is specified in `../_shared/shared.pkrvars.hcl`
}

# `target` as received from `make`
variable "target" {
  type        = string
  description = "Build Target as received from `make`."
}

# see https://www.packer.io/docs/builders/azure/arm#use_azure_cli_auth
variable "use_azure_cli_auth" {
  type        = bool
  description = "Flag to use Azure CLI authentication."
  default     = true
}

locals {
  # set `azure_tags` to generated value, unless it is user-specified
  //  generated_azure_tags =
  //  azure_tags = var.azure_tags == {} ? local.generated_azure_tags : var.azure_tags

  managed_image_information_timestamp = formatdate(var.shared.image_information_date_format, timestamp())

  # set `image_name_prefix` to shared value, unless it is user-specified
  managed_image_name = var.managed_image_name == "" ? var.shared.name : var.managed_image_name

  # set `image_version` to generated value, unless it is user-defined
  managed_image_version   = var.managed_image_version == "" ? formatdate(var.shared.image_version_date_format, timestamp()) : var.managed_image_version
  managed_image_name_full = "${local.managed_image_name}-${local.managed_image_version}"

  # concatenate repository-defined extra arguments for Ansible with user-defined ones
  # see https://www.packer.io/docs/provisioners/ansible#ansible_env_vars
  ansible_extra_arguments = concat(
    # repository-defined extra arguments for Ansible
    [
      "--extra-vars", "build_target=${var.target}"
    ],

    # user-defined extra arguments for Ansible
    var.shared.ansible.extra_arguments
  )

  version_description = templatefile(var.shared.templates.versions, {
    shared    = var.shared
    name      = local.managed_image_name_full
    version   = local.managed_image_version
    timestamp = local.managed_image_information_timestamp
  })
}
