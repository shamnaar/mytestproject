resource "aws_security_group" "tf_security_group" {
  name = "terraform-sg"
  description = "Test security group."
  vpc_id = "vpc-7c926817"
}
resource "aws_security_group_rule" "ingress_access" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = "${aws_security_group.tf_security_group.id}"
}
resource "aws_security_group_rule" "egress_access" {
  type = "egress"
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]
  security_group_id = "${aws_security_group.tf_security_group.id}"
}
resource "aws_instance" "tf_instance" {
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.tf_security_group.id}" ]
  associate_public_ip_address = true
  tags = {
    Name = "tf-myinstance"
  }

  ami = "ami-0d5d9d301c853a04a"
  availability_zone = "us-east-2c"

  subnet_id = "subnet-1025a55c"
