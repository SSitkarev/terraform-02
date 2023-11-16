###common vars

variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS version"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "vm_db_cores" {
  type        = string
  default     = "2"
  description = "cores"
}

variable "vm_db_memory" {
  type        = string
  default     = "2"
  description = "memory"
}

variable "vm_db_core_fraction" {
  type        = string
  default     = "20"
  description = "core_fraction"
}

variable "all_vms_resources" {
  type = map(map(number))
  description = "all vms resources"
  default = {
    "vm_web_resources" = {
      "cores" = 2
      "memory" = 1
      "core_fraction" = 5
    }
    "vm_db_resources" = {
      "cores" = 2
      "memory" = 2
      "core_fraction" = 20
    }
  }
}

variable "metadata" {
  description = "all vms metadata"
  type = map(string)
  default = {
    "serial-port-enable" = "1"
    "ssh-keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz+JNFiDMI9Rc8xWEm3Mi9BM9VC5CX8HgWYfTBDGPEp2Anehaw8YAZdLpnNvJPm9Lz7ARMZ2BQ0ilTvXVLyFT/y4NJc9y5I049NJHsdbPqFhEwe2gpJDNqypeKVaGmEwgPCiEi2Hen/X4+BbeV2XI4z56ac1v4mWob9K/oG+N+iXRoiQhqwhYGrrxaijw6EvMH4LI3oSRbjy2jQKyb85dXJaZuPwpMBpxCrGd+y+XU1/IMmUsOE/OR1us5p86cA4WD8MVfJQZyNbS2q3q2rMaWQg3QmJ5lpkOoRauK3QdLIeP+FcnfEmbFeRVs5o6/wd3tGlo2xgP8ITVcwsMKobQp sergey@Sergey-Work"
  }
  
}