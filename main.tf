module "vpc" {
  source = "./modules/vpc"
  # Additional parameters, such as CIDR block
}

module "web_subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}

module "app_subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
}

module "data_subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2a"
}

module "web_sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "app_sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "data_sg" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "fargate" {
  source = "./modules/fargate"
  web_subnet_id = module.web_subnet.subnet_id
  app_subnet_id = module.app_subnet.subnet_id
  data_subnet_id = module.data_subnet.subnet_id
}

module "demo_vpc" {
  source = "./modules/vpc"
  # Additional parameters for the demo VPC
}

module "demo_subnet" {
  source = "./modules/subnet"
  vpc_id = module.demo_vpc.vpc_id
}

resource "aws_instance" "demo_on_premises" {
  ami           = "ami-EXAMPLE"
  instance_type = "t2.micro"
  subnet_id     = module.demo_subnet.subnet_id
}

resource "aws_vpn_gateway" "vpn_gateway" {
  vpc_id = module.vpc.vpc_id
}

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = aws_instance.demo_on_premises.public_ip
  type       = "ipsec.1"
}

resource "aws_vpn_connection" "vpn_connection" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gateway.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
}
