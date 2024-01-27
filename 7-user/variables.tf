variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project     = "roboshop"
    Environment = "dev"
  }
}

variable "zone_name" {
  default = "ladoo.shop"

}

variable "tags" {
  default = {
    component = "user"
  }
}

# variable "vpc_id" {
#   default = data.vpc_id.value
# }

# variable "user_sg_id" {
#   default = data.user_sg_id.value
# }

# variable "app_lb_listener_arn" {

#   default = data.app_lb_listener_arn.value

# }

# variable "ami_id" {
#   default = data.centos8.id

# }
