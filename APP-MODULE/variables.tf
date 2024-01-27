variable "project_name" {
  #default = "roboshop"
}

variable "environment" {
  # default = "tf"
}

variable "common_tags" {
  # default = {
  #   Project     = "roboshop"
  #   Environment = "tf"
  # }
}

variable "zone_name" {
  # default = "ladoo.shop"
}

variable "tags" {
  # default = {
  #   component = "catalogue"
  # }
}


variable "vpc_id" {

}

variable "component_sg_id" {

}

variable "private_subnet_ids" {

}

variable "iam_instance_profile" {

}

variable "app_lb_listener_arn" {

}

variable "priority_rule" {

}
