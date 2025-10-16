# Amazon Threat-Composer Application deployed via ECS

<div align="center">
    <img src="./images/Screenshot 2025-10-13 175730.png" alt="Diagram" width="600"/>
</div>

This is a deployment of the Amazon Threat-composer app, which is an open source threat modelling tool.

## Overview

- Runs on HTTPS for end-to-end encryption
- Deployed on ECS Fargate. 
- Docker to make the application lightweight & reusable. 
- Terraform to provision AWS infrastructure.
- CI/CD pipelines on GitHub Actions to automate the deployment of the app along with the infrastructure.

### Directory Structure

└── ./
    ├── .github
    │   └── workflows
    │       ├── apply.yml
    │       ├── destroy.yml
    │       ├── plan.yml
    │       └── push.yml
    ├── app
    │   └── Dockerfile
    ├── Terraform
    │   ├── modules
    │   │   ├── acm
    │   │   │   ├── main.tf
    │   │   │   ├── outputs.tf
    │   │   │   └── variables.tf
    │   │   ├── alb
    │   │   │   ├── main.tf
    │   │   │   ├── outputs.tf
    │   │   │   └── variables.tf
    │   │   ├── ecs
    │   │   │   ├── main.tf
    │   │   │   ├── outputs.tf
    │   │   │   └── variables.tf
    │   │   ├── route53
    │   │   │   ├── main.tf
    │   │   │   ├── outputs.tf
    │   │   │   └── variables.tf
    │   │   ├── security-grps
    │   │   │   ├── main.tf
    │   │   │   ├── outputs.tf
    │   │   │   └── variables.tf
    │   │   └── vpc
    │   │       ├── main.tf
    │   │       ├── outputs.tf
    │   │       └── variables.tf
    │   ├── main.tf
    │   ├── provider.tf
    │   └── terraform.tfvars
    └── README.md


## Infrasructure

<div align="center">
    <img src="./images/Screenshot 2025-10-16 142838.png" alt="Diagram" width="600"/>
</div>

- Multi-AZ deployment for high availabilty.
- Tasks run in private subnet w/ internet access through NAT Gateways to deny direct public access
- Load Balancing and HTTPS redirection provided through an ALB
- Security groups to restrict access to resources
- Route 53 hosted zone and ACM configured to allow the app to be reached on https://tm.nginxsiad.com

## Docker

- Container runs as a non-root user to mitigate the impact of unauthorised access
- ENTRYPOINT over CMD to prevent startup command being overidden by malware
- Minimal base image to cut unecessary bloat and reduce final image size & disk usage

## Terraform 

- Modularised structutre for readability
- Remote backend configured Amazon S3 to allow collaboration within large teams
- Pre-commit hooks to enforce syntax and best-practices

## CI/CD

- Docker push and Terraform plan, apply and destroy all automated using GitHub actions
- Trivy (Docker) and Checkov (Terraform) scans to check for any vulnerabilities in the setup
- Manual workflows to prevent any unwanted changes
- Secrets & sensitive data stored in GitHub secrets to enforce principle of least privillege and prevent information being compromised

## Local App Setup

```bash
yarn install
DISABLE_ESLINT_PLUGIN=true yarn build
yarn global add serve
serve -s build
```

then go to ```http://localhost:3000```