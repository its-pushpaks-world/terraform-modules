# 🏗️ Terraform Modules for AWS Infrastructure

Reusable Terraform modules designed to standardize AWS infrastructure provisioning across projects.

This repository serves as the foundational Infrastructure as Code (IaC) layer for the Observability Platform project and provides reusable AWS networking and compute modules.

---

## 🚀 Features

✅ Modular Terraform Design

✅ Reusable AWS Infrastructure Components

✅ Standardized Networking Configuration

✅ EC2 Provisioning Support

✅ User Data Bootstrapping

✅ Easy Integration Across Projects

---

## 🏛️ Repository Role

This repository is consumed by:

```text
terraform-modules
        │
        ▼
observability-infra-proj
        │
        ▼
AWS Infrastructure
        │
        ▼
gitops-observability-apps
```

---

## 🛠️ Technologies Used

- Terraform
- AWS EC2
- AWS VPC
- AWS Security Groups
- GitHub

---

## 📂 Available Modules

### 🌐 Network Module (`/vpc`)

Creates:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association

#### Inputs

| Variable | Description |
|-----------|------------|
| vpc_cidr | VPC CIDR Block |
| subnet_cidr | Public Subnet CIDR |
| az | Availability Zone |

#### Outputs

| Output | Description |
|---------|------------|
| vpc_id | Created VPC ID |
| subnet_id | Created Subnet ID |

---

### 💻 Compute Module (`/ec2-instance`)

Creates:

- EC2 Instance
- Security Group
- User Data Bootstrap Support

#### Inputs

| Variable | Description |
|-----------|------------|
| instance_name | EC2 Name |
| vpc_id | Target VPC |
| subnet_id | Target Subnet |
| user_data | Bootstrap Script |

#### Outputs

| Output | Description |
|---------|------------|
| public_ip | Public IP |
| private_ip | Private IP |

---

## 📖 Usage Example

```hcl
module "network" {
  source      = "git::https://github.com/its-pushpaks-world/terraform-modules.git//vpc?ref=main"

  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  az          = "ap-south-1a"
}
```

---

## 🔗 Related Repositories

- observability-infra-proj
- gitops-observability-apps

---

## 👨‍💻 Author

**Pushpak Badadale**

📧 Email: [itspushpaksworld496@gmail.com](mailto:itspushpaksworld496@gmail.com)

💼 LinkedIn: https://linkedin.com/in/your-linkedin-profile

🐙 GitHub: https://github.com/its-pushpaks-world
