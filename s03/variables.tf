variable "cidr" {
    type = string  
    #default = "10.0.0.0/24" ## if don't define this default terraform ask us at runtime.
}
variable "public_subnet_cidr" {
    type = string
}
variable "tags" {
    type = map(string)
}