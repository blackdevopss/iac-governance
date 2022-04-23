variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}


variable "tags" {
  type = map(string)
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}