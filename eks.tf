module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
  cluster_name    = "kubePilot-cluster"
  cluster_version = "1.27"
  subnet_ids      = ["subnet-0664059678e2e5d49", "subnet-0f040d4fc75678d58", "subnet-09166fd23123d4dcd"]
  vpc_id          = "vpc-0583b57a0e4ed943e"
  
  node_groups = {
    eks_nodes = {
      desired_capacity = 4
      max_capacity     = 4
      min_capacity     = 1

      instance_type = "m5.large"
    }
  }
}
