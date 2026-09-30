#!/usr/bin/env bash
set -euo pipefail
kubectl argo rollouts abort gitops-demo -n gitops-demo
kubectl argo rollouts undo gitops-demo -n gitops-demo
