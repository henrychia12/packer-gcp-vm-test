output "frontend-ip" {
	value = "${google_compute_instance.frontend.network_interface.0.access_config.0.nat_ip}"
}
output "jenkins-ip" {
	value = "${google_compute_instance.jenkins.network_interface.0.access_config.0.nat_ip}"
}
