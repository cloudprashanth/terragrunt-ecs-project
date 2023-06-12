terraform {
  source = "git@github.com:itzprashanth/terraform-ecs-project.git//modules/ec2?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../vpc"]
}

dependency "vpc" {
  config_path = "../vpc"
}

# Indicate the input values to use for the variables of the module.
inputs = {
  public_subnets = dependency.vpc.outputs.public_subnets
  web_sg         = dependency.vpc.outputs.web_sg
  main_vpc       = dependency.vpc.outputs.main_vpc_id
}