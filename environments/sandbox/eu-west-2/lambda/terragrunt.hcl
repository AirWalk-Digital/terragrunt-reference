terraform {
  source = "git::git@github.com:XXXXX/XXXXX.git//modules/lambda?ref=XXXXX"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  aws_region = "eu-west-2"
  
}