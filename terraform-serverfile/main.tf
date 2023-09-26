resource "aws_instance" "test-server1" {
  ami                    = "ami-0f5ee92e2d63afc18"
  instance_type          = "t2.micro"
  key_name               = "insure-key"
  vpc_security_group_ids = ["sg-06f4f0628632ed8fe"]
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./insure-key.pem")
    host        = self.private_ip
  }
  provisioner "remote-exec" {
    inline = ["echo 'wait to start the instance' "]
  }
  tags = {
    Name = "BankingTest-Server"
  }
  provisioner "local-exec" {
    command = " echo ${aws_instance.test-server1.private_ip} > inventory "
  }
  provisioner "local-exec" {
    command = "ansible-playbook /var/lib/jenkins/workspace/BankingProject/terraform-serverfile/playbook.yml"
  }

}
