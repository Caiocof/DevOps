
resource "aws_key_pair" "vm_key" {
  key_name = "aws-key"
  #Gere um par de chaves que deseja colocar na maquina ssh-keygen -f "nome-da-chave"
  public_key = var.aws_pub_key
}


resource "aws_instance" "vm_gitlab_ci" {
  #Tipo do sistema operaciona com região, coloquei a do ubuntu22
  ami = "ami-007855ac798b5175e" # us-west-2
  #Tipo da maquina que vai subir
  instance_type = "t2.micro"

  key_name = aws_key_pair.vm_key.key_name

  #Pegas as informações do state remoto que foi criado no arquivos de vpc
  subnet_id                   = data.terraform_remote_state.remote_vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.remote_vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    "Name" = "mv-gitlab-terraform"
  }
}
