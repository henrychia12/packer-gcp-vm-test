variable "project" {
	default = "fair-melody-246109"
}
variable "name" {
	default = "default"
}
variable "frontend" {
	default = "frontend"
}
variable "CI_SERVER" {
	default = "jenkins"
}
variable "machine_type" {
	default = "n1-standard-1"
}
variable "zone" {
	default = "europe-west2-c"
}
variable "region" {
	default = "europe-west2"
}
variable "network" {
	default = "default"
}
variable "image" {
	default = "ubuntu-1804-bionic-v20190628"
}
variable "ssh_user" {
	default = "terraform"
}
variable "public_key" {
	default = "~/.ssh/id_rsa.pub"
}
variable "private_key" {
	default = "~/.ssh/id_rsa"
}
variable "package_manager" {
	default = "apt"
}
variable "update_packages" {
	default = {
		"apt" = "sudo apt update"
	}
}
variable "packages" {
	default = [
		   "wget",
		   "unzip"
		  ]
}
variable "install_packages" {
	default = {
		"apt" = "sudo apt install -y"
	}
}
variable "api-dependencies-script" {
	default = "scripts/api_dependencies_setup.sh"
}
variable "allowed_ports" {
	default = [
		   "22",
		   "8080",
		   "4200",
		   "80",
		   "5432"
		  ]
}
