module "vpc" {
  source = "../modules/vpc/"

  name = "laboratorio-elastic"

  cidr = "10.145.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets     = ["10.145.1.0/24", "10.145.2.0/24", "10.145.3.0/24"]
  public_subnets      = ["10.145.11.0/24", "10.145.12.0/24", "10.145.13.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Name        	= "laboratorio-elastic"
    environment 	= "developer"
    environment-short 	= "dev"
  }
}
