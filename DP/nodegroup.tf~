# resource "eks_managed_node_group_defaults" "ng-DP"  {
#     ami_type = "AL2_x86_64"

#   }

#   resource "eks_managed_node_groups" "ng-DP"  {
#     one = {
#       name = "node-group-1"

#       instance_types = ["t2.micro"]

#       min_size     = 2
#       max_size     = 4
#       desired_size = 2
#     }

    # two = {
    #   name = "node-group-2"

    #   instance_types = ["t2.micro"]

    #   min_size     = 2
    #   max_size     = 4
    #   desired_size = 2
    # }
  #}


# resource "aws_eks_node_group" "test" {
#   cluster_name    = var.cluster_name
#   node_group_name = "test"
#   #node_role_arn   = master.worker_iam_role_arn
#   subnet_ids      = var.vpc.private_subnets_id
#   disk_size       = 20
#   taint {
#     key = "dedicated"
#     value = "gpuGroup"
#     effect = "NO_SCHEDULE"
#   }
#   scaling_config {
#       desired_size = 1
#       max_size     = 3
#       min_size     = 1
#   }
#   labels = {
#         "some-labels" = "labels"
#   }
#   instance_types = ["t2.micro"]
  #remote_access {
  #  ec2_ssh_key = ssh-key.key_name
  #}
#}

module "eks_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "19.12.0"

  name            = "l124-DP-eks"
  cluster_name    = "l124-DP-Cluster"
  cluster_version = "1.25"
  min_size     = 1
  max_size     = 2
  desired_size = 1

  instance_types = ["t2.micro"]
  #subnet_ids = module.subnets.public_subnet_ids
  subnet_ids = module.vpc.private_subnets

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

   # attributes                         = ["micro"]
    #instance_types                      = "t2.micro"
    #eks_worker_ami_name_filter         = local.eks_worker_ami_name_filter
    #vpc_id                             = module.vpc.vpc_id
    #subnet_ids                         = module.subnets.public_subnet_ids
    #health_check_type                  = var.health_check_type
    #min_size                           = var.min_size
    #max_size                           = var.max_size
    #wait_for_capacity_timeout          = var.wait_for_capacity_timeout
    #cluster_name                       = module.label.id
    #cluster_endpoint                   = module.eks_cluster.eks_cluster_endpoint
    #cluster_certificate_authority_data = module.eks_cluster.eks_cluster_certificate_authority_data
    #cluster_security_group_id          = module.eks_cluster.eks_cluster_managed_security_group_id

    # Auto-scaling policies and CloudWatch metric alarms
    #autoscaling_policies_enabled           = var.autoscaling_policies_enabled
    #cpu_utilization_high_threshold_percent = var.cpu_utilization_high_threshold_percent
    #cpu_utilization_low_threshold_percent  = var.cpu_utilization_low_threshold_percent

    #context = module.label.context
  }

  # module "eks_workers_2" {
  #  source = "cloudposse/eks-workers/aws"
    # Cloud Posse recommends pinning every module to a specific version
    # version     = "x.x.x"

    #attributes                         = ["medium"]
    #instance_type                      = "t3.medium"
    #eks_worker_ami_name_filter         = local.eks_worker_ami_name_filter
    #vpc_id                             = module.vpc.vpc_id
    #subnet_ids                         = module.subnets.public_subnet_ids
    #health_check_type                  = var.health_check_type
    #min_size                           = var.min_size
    #max_size                           = var.max_size
    #wait_for_capacity_timeout          = var.wait_for_capacity_timeout
    #cluster_name                       = module.label.id
    #cluster_endpoint                   = module.eks_cluster.eks_cluster_endpoint
    #cluster_certificate_authority_data = module.eks_cluster.eks_cluster_certificate_authority_data
    #cluster_security_group_id          = module.eks_cluster.eks_cluster_managed_security_group_id

    # Auto-scaling policies and CloudWatch metric alarms
    #autoscaling_policies_enabled           = var.autoscaling_policies_enabled
    #cpu_utilization_high_threshold_percent = var.cpu_utilization_high_threshold_percent
    #cpu_utilization_low_threshold_percent  = var.cpu_utilization_low_threshold_percent

    #context = module.label.context
  #}