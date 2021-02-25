variable "bytelength" {
    type = number
    default = "8"
}
variable "name" {
   type = string
   default = "random_token"
}
variable "encrypted" {
    type = bool 
    default = false
}
variable "public-subnets" {
  
}
variable "vpc-id" {
  
}
variable "efs_cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}
variable "efs_sg_des" {
    type = string
    default = "Security Group For EFS Mount"
  
}
variable "efs_port" {
    type = number
    default = "2049"
}
variable "efs_port_des" {
    type = string
    default = "Allow NFS"
  
}
variable "protocol" {
    type = string
    default = "tcp"
  
}