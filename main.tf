locals {
  common_vars = {
    ansible_user = "ubuntu"
    pk_file      = "/assets/keys/snow.pem"
  }

  num_of_servers = {
    #web = 3
    db = 0
  }
}

module "ami" {
  source = "./modules/aws-ami"
}

module "nginx" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "nginx"
  instance_count = var.number_of_instance

  ami                         = module.ami.ami_map["ubuntu_2004"]
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  monitoring                  = false
  vpc_security_group_ids      = var.vpc_security_group_ids["web"]
  subnet_id                   = var.subnet_ids["nat1"]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Role        = "database"
  }
}

module "database" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "database"
  instance_count = local.num_of_servers["db"]

  ami                         = module.ami.ami_map["ubuntu_2004"]
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  monitoring                  = false
  vpc_security_group_ids      = var.vpc_security_group_ids["web"]
  subnet_id                   = var.subnet_ids["nat1"]
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Role        = "database"
    CIClass     = "compute"
  }
}

##############################
# state for ansible 
##############################

resource "ansible_host" "web" {
  #count              = local.num_of_servers["web"]
  count              = var.number_of_instance
  inventory_hostname = module.nginx.public_ip[count.index]
  groups             = ["web"]
  vars = merge(local.common_vars,
    {
      port = 80
    }
  )
}

resource "ansible_host" "db" {
  count              = local.num_of_servers["db"]
  inventory_hostname = module.database.public_ip[count.index]
  groups             = ["db"]
  vars = merge(local.common_vars,
    {
      version = "5.6"
    }
  )
}
##############################
# state for saltstack
##############################

# resource "saltstack_host" "web" {
#   count              = local.num_of_servers["web"]
#   inventory_hostname = module.nginx.public_ip[count.index]
#   groups             = ["web"]
#   vars = merge(local.common_vars,
#     {
#       port = 80
#     }
#   )
# }

# resource "saltstack_host" "db" {
#   count              = local.num_of_servers["db"]
#   inventory_hostname = module.database.public_ip[count.index]
#   groups             = ["db"]
#   vars = merge(local.common_vars,
#     {
#       version = "5.6"
#     }
#   )
# }
