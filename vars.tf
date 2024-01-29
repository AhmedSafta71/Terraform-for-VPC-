variable "REGION" {
  default = "use-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami746523045345"
    us-east-2 = "ami745790594850"
  }

}
variable "USER" {
  default = "aws-user"
}
variable  "MYIP"{
  default  =  ""
}