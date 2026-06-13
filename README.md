# terraform-modules

This repository contains reusable, modular Terraform configurations for provisioning standard AWS infrastructure components. It acts as the source module library for upstream deployment projects.

## Available Modules

### 1. Network Module (`/vpc`)
Provisions a Virtual Private Cloud (VPC) optimized for public-facing application layers.
* **Inputs:** `vpc_cidr`, `subnet_cidr`, `az`
* **Outputs:** `vpc_id`, `subnet_id`

### 2. Compute Module (`/ec2-instance`)
Provisions standardized EC2 instances with native support for `user_data` bootstrapping.
* **Inputs:** `instance_name`, `vpc_id`, `subnet_id`, `user_data`
* **Outputs:** `public_ip`, `private_ip`

## Usage Example
Reference these modules in your root Terraform configurations:
```hcl
module "network" {
  #source      = "git::https://github.com/<your-org>/terraform-modules.git//vpc?ref=main"
  source      = "git::https://github.com/its-pushpaks-world/terraform-modules.git//vpc?ref=main"
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "ap-south-1a"
}
