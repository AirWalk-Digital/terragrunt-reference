  remote_state {
    backend = "s3"
    config = {
        bucket         = "sandbox-terraform-state"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = "eu-west-2"
        encrypt        = true
        dynamodb_table = "sandbox-terraform-lock-table"
        profile        = "sandbox_iam" 
    }
}

terraform {
  # Force Terraform to keep trying to acquire a lock for
  # up to 20 minutes if someone else already has the lock
  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=2m"]
  }

  # Pass custom var files to Terraform
  extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]

    arguments = []
  }
}

inputs = {
  aws_profile                  = "sandbox_iam"
  environment                   = "sandbox"
  tags = {
    Terraform = "true",
    Environment = "sandbox"
  } 
}
