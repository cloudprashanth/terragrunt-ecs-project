terraform {
  source = "git@github.com:itzprashanth/terraform-ecs-project.git//modules/cloudwatch?ref=v0.0.4"
}

include {
  path = find_in_parent_folders()
}

# Indicate the input values to use for the variables of the module.
inputs = {
  frontend_service_name = "frontend"
}