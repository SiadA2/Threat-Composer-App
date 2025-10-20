# Threat-Composer deployed on ECS Fargate

This is a deployment of the Amazon Threat-composer app, which is an open source threat modelling tool.

<div align="center">
    <img src="./images/Screenshot 2025-10-13 175730.png" alt="Diagram" width="600"/>
</div>

## Overview

- Runs on HTTPS for end-to-end encryption
- Deployed on ECS Fargate. 
- Docker to make the application lightweight & reusable. 
- Terraform to provision AWS infrastructure.
- CI/CD pipelines on GitHub Actions to automate the deployment of the app along with the infrastructure.

### Directory Structure

```bash

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
    │   │   ├── acm/
    │   │   ├── alb/
    │   │   ├── ecs/
    │   │   ├── route53/
    │   │   ├── security-grps/
    │   │   └── vpc/
    │   ├── main.tf
    │   ├── provider.tf
    │   └── variables.tf
    └── README.md
```

## Infrasructure

<div align="center">
    <img src="./images/Screenshot 2025-10-20 194319.png" alt="Diagram" width="600"/>
</div>

### Key Features

- Multi-AZ deployment for high availabilty.
- Load Balancing and HTTPS redirection provided through an ALB
- Tasks run behind the alb to prevent direct internet access
- Security groups to restrict access to resources
- Route 53 hosted zone and ACM configured to allow the app to be reached on ```https://tm.nginxsiad.com```

## Docker

- Container runs as a non-root user to mitigate the impact of unauthorised access
- ENTRYPOINT over CMD to prevent startup command being overidden by malware
- Minimal base image to cut unecessary bloat and reduce final image size & disk usage

## Terraform 

- Modularised structutre for readability
- Remote backend configured Amazon S3 to allow collaboration within large teams
- Pre-commit hooks to check for and enforce correct syntax

## CI/CD

- Docker push and Terraform plan, apply and destroy all automated using GitHub actions
- Trivy (Docker) and Checkov (Terraform) scans to check for any vulnerabilities in the setup
- Manual workflows to prevent any unwanted changes
- Secrets & sensitive data stored in GitHub secrets to enforce principle of least privillege and prevent information being compromised

## Local App Setup

```bash
yarn install
yarn build
yarn global add serve
serve -s build
```

then go to ```http://localhost:3000```