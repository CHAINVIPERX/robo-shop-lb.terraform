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
    component = "catalogue"
  }

}
