variable "environment" {
  type        = string
  description = "Enviromnet"
}

variable "key_name" {
  type        = string
  description = "key name"
}

variable "vpc_security_group_ids" {
  type        = map(any)
  description = "sg ids"
}

variable "subnet_ids" {
  type        = map(any)
  description = "subnet id map"
}

variable "number_of_instance" {
}
