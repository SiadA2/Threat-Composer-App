# Amazon Threat-Composer Application deployed via ECS

This is a deployment of the Amazon Threat-composer app, which is an open source threat modelling tool.

## Overview

- Runs on HTTPS for end-to-end encryption
- Deployed on ECS Fargate. 
- Docker used to make the application lightweight & reusable. 
- Terraform used to provision AWS infrastructure.
- CI/CD pipelines on GitHub Actions to automate the deployment of the app along with the infrastructure.

### App Structure

## Architecture

- Multi-AZ deployment for high availabilty.
- Tasks run in private subnet w/ internet access through NAT Gateways to deny direct public access
- Load Balancing and HTTPS redirection provided through an ALB
- Security groups to restrict access to resources
- Route 53 hosted zone and ACM configured to allow the app to be reached on https://tm.nginxsiad.com

## Docker

- Container runs as a non-root user to prevent any unauthorised access
- ENTRYPOINT over CMD to prevent startup command being overidden by malware
- Mutistage build & minimal base image to reduce image size and disk usage


## Terraform 

- Modularised structutre for readability
- Remote statefile stored ion Amazon S3 to allow collaboration

## CI/CD



## Local App Setup
