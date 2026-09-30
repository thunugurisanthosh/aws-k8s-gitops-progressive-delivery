# AWS Kubernetes GitOps & Progressive Delivery Platform

Pure DevOps project: Terraform + GitHub Actions + Docker + ECR + EKS + Helm + Argo CD + Argo Rollouts + Prometheus/Grafana.

## Flow
GitHub -> GitHub Actions -> Docker -> ECR -> GitOps -> Argo CD -> EKS -> Argo Rollouts -> Prometheus/Grafana

## Requirements
AWS CLI, Terraform, Docker, kubectl, Helm, Git, AWS account and GitHub repository.

## Quick start
1. Configure AWS credentials.
2. `cd terraform && terraform init && terraform apply`
3. Configure GitHub Actions AWS credentials as repository secrets.
4. Replace the GitHub repo URL and ECR image placeholders.
5. Install Argo CD, Argo Rollouts and kube-prometheus-stack on EKS.
6. Apply `argocd/` and `rollout/` resources.

Review IAM permissions and AWS costs before applying.
