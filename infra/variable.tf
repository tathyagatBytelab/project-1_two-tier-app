variable "ecr_repo_name" {
  default = "pgagi-backend"
}

variable "container_port" {
  default = 8000
}

variable "image_tag" {
  default = "latest"
}

variable "ecs_cluster_name" {
  default = "pgagi-cluster"
}

variable "service_name" {
  default = "pgagi-service"
}
