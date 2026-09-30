data "aws_availability_zones" "available" {}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"
  name = var.project_name
  cidr = "10.20.0.0/16"
  azs = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = ["10.20.1.0/24","10.20.2.0/24","10.20.3.0/24"]
  public_subnets = ["10.20.101.0/24","10.20.102.0/24","10.20.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.24.0"
  cluster_name = var.project_name
  cluster_version = "1.30"
  cluster_endpoint_public_access = true
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  eks_managed_node_groups = { default = { instance_types = ["t3.medium"] min_size = 1 max_size = 2 desired_size = 1 } }
}
resource "aws_ecr_repository" "app" { name = var.project_name image_tag_mutability = "MUTABLE" force_delete = true }
output "cluster_name" { value = module.eks.cluster_name }
output "ecr_repository_url" { value = aws_ecr_repository.app.repository_url }
