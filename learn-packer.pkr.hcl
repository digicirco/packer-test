packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type    = string
  default = "ubuntu:xenial"
}

variable "docker_hub_account" {
  type    = string
  default = ""
}

variable "docker_hub_password" {
  type    = string
  default = ""
}

source "docker" "ubuntu" {
  image  = var.docker_image
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
      "echo Running ${var.docker_image} Docker image."
    ]
  }

  provisioner "shell" {
    inline = ["echo This provisioner runs last"]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "${var.docker_hub_account}/learn-packer"
      tags       = ["0.0.2"]
    }

    post-processor "docker-push" {
      login          = true
      login_username = var.docker_hub_account
      login_password = var.docker_hub_password
    }
  }
}
