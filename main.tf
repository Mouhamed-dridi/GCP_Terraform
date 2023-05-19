provider "google" {
  project = "qwiklabs-gcp-02-43874fc0516a"
}

resource "google_compute_network" "webserver_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "webserver_subnetwork" {
  name          = "my-subnetwork"
  region        = "us-central1"
  network       = google_compute_network.webserver_network.self_link
  ip_cidr_range = "10.10.10.0/24"
}

resource "google_compute_instance" "vm_instance" {
  name         = "web-server"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  metadata_startup_script = <<-SCRIPT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    systemctl enable apache2
    systemctl start apache2
  SCRIPT

  network_interface {
    network    = google_compute_network.webserver_network.self_link
    subnetwork = google_compute_subnetwork.webserver_subnetwork.self_link
    access_config {}
  }
}
