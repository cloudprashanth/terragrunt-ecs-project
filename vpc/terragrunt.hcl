terraform {
  source = "git@github.com:itzprashanth/terraform-ecs-project.git//modules/vpc?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

# Indicate the input values to use for the variables of the module.
inputs = {
  vpc_main_cidr    = "10.0.0.0/18"
  instance_tenancy = "default"
  env              = "dev"
  tags             = {
    Terraform   = "true"
    Environment = "dev"
  }
}