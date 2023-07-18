data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

variable "image_tag" {
  description = "Image tag for the Docker image"
}

variable "commit_sha" {
  description = "Commit SHA of the code"
}

resource "kubernetes_deployment" "kube-pilot-dev" {
  metadata {
    name      = "kube-pilot-app"
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
          image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/kube-pilot:${var.image_tag}"
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
            value = var.commit_sha
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
