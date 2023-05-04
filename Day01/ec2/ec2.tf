resource "aws_instance" "example" {
  ami           = "ami-0bb6af715826253bf"
  instance_type = "t2.micro"
}