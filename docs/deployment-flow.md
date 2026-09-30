# Deployment Flow
1. Push to main.
2. GitHub Actions tests and builds.
3. Image is pushed to ECR.
4. GitOps desired state is reconciled by Argo CD.
5. Argo Rollouts performs canary deployment.
6. Prometheus/Grafana provide observability.
