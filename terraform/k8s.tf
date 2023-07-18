resource "kubernetes_deployment" "kube-pilot-dev" {
  metadata {
    name = "kube-pilot-app"
    namespace = kubernetes_namespace.kube-pilot-dev.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        App = "kube-pilot-app"
      }
    }

    template {
      metadata {
        labels = {
          App = "kube-pilot-app"
        }
      }

      spec {
        container {
          image = "<AWS_ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/<ECR_REPOSITORY_NAME>:<IMAGE_TAG>"
          name  = "kube-pilot-app"

          port {
            container_port = 8080
          }

          env {
            name  = "ENVIRONMENT"
            value = "dev"
          }

          env {
            name  = "COMMIT_SHA"
            value = "<COMMIT_SHA>"
          }

          readiness_probe {
            http_get {
              path = "/ready"
              port = "8080"
            }

            initial_delay_seconds = 5
            period_seconds        = 5
          }

          liveness_probe {
            http_get {
              path = "/healthz"
              port = "8080"
            }

            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }
      }
    }
  }
}
