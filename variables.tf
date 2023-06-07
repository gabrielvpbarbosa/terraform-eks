variable "region_provider" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "cluster-name" {
  type = string
}
variable "cluster_version" {
  type = string
}
variable "instance_type" {
  type = string
}

variable "instance_desired_size" {
  type = number
}
variable "instance_max_size" {
  type = number
}
variable "instance_min_size" {
  type = number
}

variable "disk_size" {
  type = number
}

variable "vpc_cidr_block" {
  type = string
}

