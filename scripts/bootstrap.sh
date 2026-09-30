#!/usr/bin/env bash
set -euo pipefail
aws eks update-kubeconfig --region ap-south-1 --name gitops-platform
kubectl create namespace gitops-demo --dry-run=client -o yaml | kubectl apply -f -
