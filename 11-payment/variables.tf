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

variable "zone_name" {
  default = "ladoo.shop"

}

variable "tags" {
  default = {
    component = "payment"
  }
}

variable "vpc_id" {
  default = data.vpc_id.value
}

variable "payment_sg_id" {
  default = data.payment_sg_id.value
}

variable "app_lb_listener_arn" {

  default = data.app_lb_listener_arn.value

}

# variable "ami_id" {
#   default = data.centos8.id

# }
