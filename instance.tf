# set resources
resource "aws_key_pair" "dove-key" {
  key_name   = "dove-key"
  public_key = file("dove-key")
}
resource "aws_instance" "dove-instance-web" {
  ami               = var.AMIS[var.REGION]
  instance_type     = "t2.micro"
  availability_zone = var.ZONE1
  subnet_id = aws_subnet.dove-pub-sub-1.id
  # Get  the name a through specified parameters in the  instance  
  key_name        = aws_key_pair.dove-key.key_name
  vpc_security_group_ids =  [aws_security_group.dove_sg.id]

  tags = {
    Name    = "dove-instance-ex3"
    Project = "exercice3"
  }
  # specify the  provisioner file  that holds the file script  to execute  with the remote exec  provisioner
  provisioner "file" {
    source      = "./web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    type        = "ssh"
    user        = var.USER
    private_key = file("dove-key")
    host        = self.public_ip

  }

}
output "publicIp" {
    value = aws_instance.dove-instance.public_ip

}

output "privateIp" {
    value = aws_instance.dove-instance.private_ip
}

# creating elb  instance  
resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 3

  tags = {
    Name = "extr-vol-4-dove"
  }
} 
#  creating an attachement  of in ec2 instance with a elb  

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.dove-instance-web.id
}
