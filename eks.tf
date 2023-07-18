module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = "kubePilot-cluster"
  cluster_version = "1.27"
  subnet_ids      = ["subnet-0664059678e2e5d49", "subnet-0f040d4fc75678d58", "subnet-09166fd23123d4dcd"]
  vpc_id          = "vpc-0583b57a0e4ed943e"

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
    min_size = 1
    max_size = 4
    desired_size = 4
  }

  eks_managed_node_groups = {
    mygroup = {}
  }
}
