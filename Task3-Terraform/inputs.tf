variable "ami_id_ubuntu" {
    type = string
    description = "Enter Ubuntu AMI"
    default = "ami-08c40ec9ead489470" # comment this line if you would like to choose different AMI
}


variable "ami_id_centos" {
    type = string
    description = "Enter CentOS AMI"
    default = "ami-00e87074e52e6c9f9" # comment this line if you would like to choose different AMI
}