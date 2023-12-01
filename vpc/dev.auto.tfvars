main = {
  project = ""
  region  = "europe-west1"
}

#################### VPC Inputs #######################
networks = {
  vpc1 = {
    project_id              = ""
    network_name            = "vpc1-network"
    routing_mode            = "REGIONAL"
    description             = "VPC 1 Description"
    auto_create_subnetworks = false
    mtu                     = 1460
  }
  vpc2 = {
    project_id              = ""
    network_name            = "vpc2-network"
    routing_mode            = "GLOBAL"
    description             = "VPC 2 Description"
    auto_create_subnetworks = false
    mtu                     = 1500
  }
}
#################### Subnets Inputs #######################
subnetworks = {
  subnets-1 = {
    network_name             = "vpc1-network"
    subnet_name              = "subnet1"
    subnet_ip                = "10.0.1.0/24"
    subnet_region            = "us-central1"
    private_ip_google_access = true
  }

  subnets-2 = {
    network_name             = "vpc1-network"
    subnet_name              = "subnet2"
    subnet_ip                = "10.0.2.0/24"
    subnet_region            = "us-east1"
    private_ip_google_access = false
  }
  subnets-3 = {
    network_name             = "vpc2-network"
    subnet_name              = "subnet1"
    subnet_ip                = "10.1.1.0/24"
    subnet_region            = "us-west1"
    private_ip_google_access = true
  }
  subnets-4 = {
    network_name             = "vpc2-network"
    subnet_name              = "subnet2"
    subnet_ip                = "10.1.2.0/24"
    subnet_region            = "us-east4"
    private_ip_google_access = false
  }

}
#################### Firewall Rules Inputs #######################
firewall_rules = {
  fw_hc = {
    name      = "fw-allow-hc"
    direction = "INGRESS"
    network   = "vpc1-network"
    source_ranges = [
      "130.211.0.0/22",
      "35.191.0.0/16",
      "35.235.240.0/20"
    ]
    target_tags = [
      "allow-health-check"
    ]
    allow = [
      {
        "protocol" = "tcp"
        "ports"    = []
      }
    ]
  }
  fw_backends = {
    name      = "fw-backends"
    direction = "INGRESS"
    network   = "vpc1-network"
    source_ranges = [
      "10.0.1.0/24"
    ]
    target_tags = []
    allow = [
      {
        protocol = "tcp"
        ports    = []
      },
      {
        protocol = "udp"
        ports    = []
      },
      {
        protocol = "icmp"
        ports    = []
      }
    ]
  }
  fw_ssh = {
    name      = "fw-ssh"
    direction = "INGRESS"
    network   = "vpc1-network"
    source_ranges = [
      "0.0.0.0/0"
    ]
    target_tags = [
      "allow-ssh"
    ]
    allow = [
      {
        protocol = "tcp"
        ports = [
          "22"
        ]
      }
    ]
  }
}