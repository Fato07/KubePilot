# KubePilot

## Goal

Create a EKS cluster, with a node group of 4 nodes. Create two names paces for dev and prod.

Create a dummy application that is containerized, has health check endpoints for liveness and readiness probes.

Develop a pipeline that builds this app and stores the image in ecr, and deploys to the dev and prod namespace.

The app should then display the current environment it's in, and the commit sha of the image tag.
