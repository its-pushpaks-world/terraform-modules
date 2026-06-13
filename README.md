# Terraform Modules

Reusable Terraform modules for provisioning AWS infrastructure components used by the Observability Platform project.

## Overview

This repository contains modular Terraform code that follows Infrastructure as Code (IaC) principles and can be consumed by multiple deployment projects.

The modules provide reusable building blocks for:

* AWS VPC
* Public Subnet
* Internet Gateway
* Route Tables
* EC2 Instances
* Security Groups

## Repository Structure

```text
terraform-modules/
├── vpc/
│   └── main.tf
│
└── ec2-instance/
    └── main.tf
```

## Available Modules

### VPC Module

Creates:

* VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association

#### Inputs

| Variable    | Description        |
| ----------- | ------------------ |
| vpc_cidr    | VPC CIDR Block     |
| subnet_cidr | Public Subnet CIDR |
| az          | Availability Zone  |

#### Outputs

| Output    | Description |
| --------- | ----------- |
| vpc_id    | VPC ID      |
| subnet_id | Subnet ID   |

---

### EC2 Module

Creates:

* EC2 Instance
* Security Group
* User Data Bootstrap Support

#### Inputs

| Variable      | Description       |
| ------------- | ----------------- |
| instance_name | EC2 Name          |
| vpc_id        | Target VPC        |
| subnet_id     | Target Subnet     |
| user_data     | Bootstrap Script  |
| instance_type | EC2 Instance Type |

#### Outputs

| Output     | Description |
| ---------- | ----------- |
| public_ip  | Public IP   |
| private_ip | Private IP  |

## Example Usage

```hcl
module "network" {
  source      = "git::https://github.com/its-pushpaks-world/terraform-modules.git//vpc?ref=main"

  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "ap-south-1a"
}
```

## Skills Demonstrated

* Terraform
* Infrastructure as Code (IaC)
* AWS Networking
* AWS EC2
* Modular Design
* Reusable Infrastructure Components
* Git Version Control

## Related Repositories

* observability-infra-proj
* gitops-observability-apps

## Author

Pushpak Badadale [itspushpaksworld496@gmail.com]
DevOps | Cloud | Observability
