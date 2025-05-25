# Terraform + Terragrunt Modular Infrastructure

This project provides a complete example of a modular Terraform infrastructure setup with Terragrunt support, organized by environments.

## 📁 Directory Structure

```
terraform_project/
├── environments/
│   ├── dev/
│   ├── staging/
│   └── prod/
├── modules/
│   ├── network/
│   ├── compute/
│   └── data/
└── terragrunt/
    ├── dev/
    ├── staging/
    ├── prod/
```

## 🧱 Modules

- `network/` – Defines VPC and subnets
- `compute/` – Defines EC2 instances
- `data/` – Defines S3 bucket

## 🌍 Environments

Each environment (`dev`, `staging`, `prod`) includes:
- Terraform configuration with variables and backend
- Separate state files via S3 backend
- `*.tfvars` files for environment-specific values

## 📦 Terragrunt

Terragrunt is used to wrap Terraform commands, manage remote state, and DRY configuration.

### 🗂 Terragrunt Structure

Each environment (`terragrunt/dev`, `terragrunt/staging`, etc.) contains a `terragrunt.hcl`:

```hcl
terraform {
  source = "../../modules//?ref=dev"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  ...
}
```

The root `terragrunt.hcl` sets up remote state and locking:

```hcl
remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-backend-global"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

## 🚀 Usage

### Terraform (without Terragrunt)

```bash
cd environments/dev
terraform init -backend-config=backend.tf
terraform apply -var-file=dev.tfvars
```

### Terragrunt (recommended)

```bash
cd terragrunt/dev
terragrunt init
terragrunt apply
```

## ✅ Prerequisites

- Terraform CLI
- Terragrunt CLI
- AWS credentials
- S3 bucket and DynamoDB table for remote state

## 📝 Notes

- Adjust `backend.tf` or `terragrunt.hcl` to match your AWS setup.
- Use version control (e.g. Git) to manage infrastructure changes.

---

Happy Infrastructure as Code! 🚀