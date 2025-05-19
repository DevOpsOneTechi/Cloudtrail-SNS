terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "mycloudtrailbucket123"
    key          = "vpcec2/terraform.tfstateec21"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
