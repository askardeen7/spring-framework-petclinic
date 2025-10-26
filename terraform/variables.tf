variable "aws_region" {
  default = "us-west-1"
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_name" {
  default = "petclinic-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "allowed_ssh_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
