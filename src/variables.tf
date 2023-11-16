###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz+JNFiDMI9Rc8xWEm3Mi9BM9VC5CX8HgWYfTBDGPEp2Anehaw8YAZdLpnNvJPm9Lz7ARMZ2BQ0ilTvXVLyFT/y4NJc9y5I049NJHsdbPqFhEwe2gpJDNqypeKVaGmEwgPCiEi2Hen/X4+BbeV2XI4z56ac1v4mWob9K/oG+N+iXRoiQhqwhYGrrxaijw6EvMH4LI3oSRbjy2jQKyb85dXJaZuPwpMBpxCrGd+y+XU1/IMmUsOE/OR1us5p86cA4WD8MVfJQZyNbS2q3q2rMaWQg3QmJ5lpkOoRauK3QdLIeP+FcnfEmbFeRVs5o6/wd3tGlo2xgP8ITVcwsMKobQp sergey@Sergey-Work"
  description = "ssh-keygen -t ed25519"
}

###common vars

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS version"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "vm_web_cores" {
  type        = string
  default     = "2"
  description = "cores"
}

variable "vm_web_memory" {
  type        = string
  default     = "1"
  description = "memory"
}

variable "vm_web_core_fraction" {
  type        = string
  default     = "5"
  description = "core_fraction"
}