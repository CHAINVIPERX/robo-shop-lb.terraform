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



variable "tags" {

  default = {
    component = "ladoo_certificate"
  }

}