provider "aws" {
  region = "ap-south-1"


}
resource "aws_instance" "example_1" {

  ami           = "ami-0f2ce9ce760bd7133"
  instance_type = "t2.micro"
  key_name      = "anusha"
  tags = {
    Name = "production"
  }
  security_groups = [aws_security_group.example_sg.name]
  user_data       = file("sample.sh")
  count           = 2
}
resource "aws_security_group" "example_sg" {
  tags = {
    Name = "astroids"
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}