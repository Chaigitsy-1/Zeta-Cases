variable "AWS_REGION" {
    default="ap-south-1"
}
variable "access" {
    type = string
    description= "type of subnet , set to true if public false if private"
}
variable "cidr" {
  description = "CIDR BLOCK"
  type        = string
}