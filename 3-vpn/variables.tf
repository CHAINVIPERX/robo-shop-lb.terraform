variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "tf"
}

variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "tf"

  }

}

output "vpn_public_ip" {
  value = module.vpn.public_ip

}