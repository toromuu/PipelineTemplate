variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "INSTANCE_TYPE" { 
  default = "t2.micro" 
}

variable "KEY_NAME" { 
  default = "jenkins" 
}

variable "PRIVATE_KEY_PATH" {
  default = "jenkins.pem"
}

