terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_container" "frontend" {
  name  = "smart-task-frontend-terraform"
  image = "smart-task-management-system-main-frontend:latest"

  ports {
    internal = 80
    external = 5174
  }
}
