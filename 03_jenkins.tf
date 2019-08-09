resource "google_compute_instance" "jenkins" {
	name = "${var.name}-${var.CI_SERVER}"
	machine_type = "${var.machine_type}"
	zone = "${var.zone}"
	tags = ["${var.name}-${var.CI_SERVER}"]
	boot_disk {
		initialize_params {
			image = "${var.jenkins_image_ID}"
		}
	}
	network_interface {
		network = "${var.network}"
		access_config {
			// Ephemeral IP
		}
	}
	lifecycle {
		ignore_changes = ["attached_disk"]
	}
	metadata = {
		sshKeys = "${var.ssh_user}:${file("${var.public_key}")}"
	}
	connection {
		type = "ssh"
		user = "${var.ssh_user}"
		host = "${google_compute_instance.jenkins.network_interface.0.access_config.0.nat_ip}"
		private_key = "${file("${var.private_key}")}"
	}
}

resource "google_compute_disk" "jenkins-data" {
	name   = "${var.CI_SERVER}-disk"
	type   = "pd-standard"
	zone   = "${var.zone}"
	size   = 90
	labels = {
		environment = "jenkins"
	}
	physical_block_size_bytes = 4096
}

resource "google_compute_attached_disk" "jenkins-data-attached" {
	disk = "${google_compute_disk.jenkins-data.self_link}"
	instance = "${google_compute_instance.jenkins.self_link}"
}
