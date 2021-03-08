output "ami_map" {
  value = {
    ubuntu_2004            = data.aws_ami.ubuntu_2004.image_id,
    ubuntu_1804            = data.aws_ami.ubuntu_1804.image_id,
    ubuntu_1604            = data.aws_ami.ubuntu_1604.image_id,
    redhat_6               = data.aws_ami.redhat_6.image_id,
    centos_6               = data.aws_ami.centos_6.image_id,
    centos_7               = data.aws_ami.centos_7.image_id,
    centos_8               = data.aws_ami.centos_8.image_id,
    windows_2019           = data.aws_ami.windows_2019.image_id,
    windows_2012r2         = data.aws_ssm_parameter.windows_2012r2_ami.value,
    windows_2019_ecs       = data.aws_ssm_parameter.windows_2019_ecs_ami.value,
    amazonlinux-2          = data.aws_ami.amazon-linux-2.image_id,
    amazonlinux-ecs-latest = data.aws_ami.amazon-linux-ecs-latest.image_id,
    amazonlinux-ecs-2018   = data.aws_ami.amazon-linux-ecs-2018.image_id,
  }
}
