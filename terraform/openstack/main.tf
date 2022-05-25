terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.47.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name         = "<OS_USERNAME>"
  tenant_name       = "<OS_PROJECT_NAME>"
  tenant_id         = "<OS_PROJECT_ID>"
  password          = "<OS_PASSWORD>"
  auth_url          = "<OS_AUTH_URL>"
  region            = "<OS_REGION_NAME>"
  user_domain_name  = "<OS_USER_DOMAIN_NAME>"
  project_domain_id = "<OS_PROJECT_DOMAIN_ID>"
}

data "openstack_networking_network_v2" "network" {
  name = "default_network"
}

resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "floating_network"
}

resource "openstack_blockstorage_volume_v3" "volume_1" {
  name        = "volume1-test-server"
  description = "first test volume"
  size        = 20                      # volume size in GB
  image_id    = "<IMAGE_ID>"            # OS image id
}

# Create a web server
resource "openstack_compute_instance_v2" "instance_1" {
  name            = "test-server"           # Server name
  flavor_id       = "<FLAVOR_ID>"           # OS flavor ID
  key_pair        = "<SSH_KEY_TO_DEPLOY>"   # SSH key provided in OS
  security_groups = ["default"]

  network {
    name = "default_network"
  }

  block_device {
    uuid                  = "${openstack_blockstorage_volume_v3.volume_1.id}"
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = 0
    delete_on_termination = true
  }
}

resource "openstack_compute_floatingip_associate_v2" "floatip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.floatip_1.address}"
  instance_id = "${openstack_compute_instance_v2.instance_1.id}"
}
