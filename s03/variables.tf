variable "cidr" {
    type = string  
    default = "10.0.0.0/24" ## if don't define this default terraform ask us at runtime.
}