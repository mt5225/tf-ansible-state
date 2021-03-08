###
# command to verify ami query
# aws ec2 describe-images --owners amazon --filters "Name=name,Values=Windows_Server-2019-English-Full-Base-*"
###

data "aws_ami" "ubuntu_2004" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_ami" "ubuntu_1804" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_ami" "ubuntu_1604" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

# https://wiki.centos.org/Cloud/AWS
data "aws_ami" "centos_6" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["ckx0h8ljio731afm2k92jtg62"]
  }

  owners = ["aws-marketplace"]
}

data "aws_ami" "centos_7" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["cvugziknvmxgqna9noibqnnsy"]
  }

  owners = ["aws-marketplace"]
}

data "aws_ami" "centos_8" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["47k9ia2igxpcce2bzo8u3kj03"]
  }

  owners = ["aws-marketplace"]
}

data "aws_ami" "redhat_6" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-6.?*GA*"]
  }

  owners = ["309956199498"]
}


data "aws_ami" "windows_2019" {
  most_recent = true
  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["801119661308"]
}

# Should we use this to get the Amazon one OR use the aws_ami data object
# Leaving AMI in the name as this isnt the aws_ami var
data "aws_ssm_parameter" "windows_2012r2_ami" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2012-R2_RTM-English-64Bit-Base"
}

#https://us-west-1.console.aws.amazon.com/systems-manager/parameters/aws/service/ami-windows-latest/Windows_Server-2019-English-Core-ECS_Optimized/description?region=us-west-2
data "aws_ssm_parameter" "windows_2019_ecs_ami" {
  name = "/aws/service/ami-windows-latest/Windows_Server-2019-English-Core-ECS_Optimized/image_id"
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

data "aws_ami" "amazon-linux-ecs-latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
}

data "aws_ami" "amazon-linux-ecs-2018" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-2018.03.g-amazon-ecs-optimized"]
  }
}
