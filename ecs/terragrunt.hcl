terraform {
  source = "git@github.com:itzprashanth/terraform-ecs-project.git//modules/ecs?ref=v0.0.5"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../vpc", "../iam", "../ec2", "../cloudwatch"]
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "iam" {
  config_path = "../iam"
}

dependency "ec2" {
  config_path = "../ec2"
}

dependency "cloudwatch" {
  config_path = "../cloudwatch"
}

# Indicate the input values to use for the variables of the module.
inputs = {
  td_role_arn             = dependency.iam.outputs.td_role_arn
  public_subnets          = dependency.vpc.outputs.public_subnets
  web_sg                  = dependency.vpc.outputs.web_sg
  frontend_tg             = dependency.ec2.outputs.web_tg_arn
  frontend_port           = 80
  elb_name                = dependency.ec2.outputs.elb_name
  account_id              = dependency.iam.outputs.account_id
  log_stream_prefix       = "ecs"
  frontend_log_group_name = dependency.cloudwatch.outputs.frontend_log_group_name
}