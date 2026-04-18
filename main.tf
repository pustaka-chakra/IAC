module "iam" {
  source = "./modules/iam"

  project_name        = var.project_name
  github_org          = var.github_org
  github_iac_repo     = var.github_iac_repo
  github_backend_repo = var.github_backend_repo
}

module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
}

module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
  aws_region   = var.aws_region
}

module "ssm" {
  source = "./modules/ssm"

  project_name = var.project_name
}

module "compute" {
  source = "./modules/compute"

  project_name              = var.project_name
  vpc_id                    = module.networking.vpc_id
  subnet_id                 = module.networking.public_subnet_id
  ec2_instance_profile_name = module.iam.ec2_instance_profile_name
  ami_id                    = var.ami_id
}

output "elastic_ip" {
  value = module.compute.elastic_ip
}
