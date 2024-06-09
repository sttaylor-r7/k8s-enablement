data "google_compute_network" "default" {
  name = "default"
}

data "google_compute_default_service_account" "default" {
}

resource "random_password" "user_password" {
  length = 16
  special = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "google_compute_instance" "vm" {
  count        = var.num_instances
  name         = "${var.instance_name}-${count.index + 1}"
  machine_type = var.machine_type
  zone         = "europe-west2-a"
  tags = ["k8s-enablement"]
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = data.google_compute_network.default.name
    access_config {
      nat_ip = google_compute_address.vm_static_ip[count.index].address
    }
  }

  service_account {
    email  = data.google_compute_default_service_account.default.email
    scopes = [ "https://www.googleapis.com/auth/cloud-platform" ]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash

    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
    sudo apt-get install -y kubectl
    
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    curl https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get -y install helm

    sudo apt-get install -y google-cloud-cli-gke-gcloud-auth-plugin

    # Add user logins
    sudo useradd -m -s /bin/bash k8s-guru
    sudo usermod -a -G docker k8s-guru
    echo "k8s-guru:${random_password.user_password.result}" | sudo chpasswd

    # Enable SSH password logins
    echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/99-local.conf
    chmod 600 /etc/ssh/sshd_config.d/99-local.conf
    sleep 5
    systemctl restart sshd

    mkdir /enablement
    git clone https://github.com/sttaylor-r7/k8s-enablement /enablement

  EOT
}

resource "google_compute_address" "vm_static_ip" {
  count = var.num_instances
  name = "ipv4-address-${count.index + 1}"
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http-enablement"
  network = data.google_compute_network.default.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["enablement"]
}