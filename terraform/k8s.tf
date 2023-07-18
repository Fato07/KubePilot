resource "kubernetes_namespace" "kube-pilot-dev" {
  metadata {
    name = "kube-pilot-dev"
  }
}

resource "kubernetes_namespace" "kube-pilot-prod" {
  metadata {
    name = "kube-pilot-prod"
  }
}

resource "kubernetes_deployment" "kube-pilot-dev" {
  metadata {
    name = "kube-pilot-app"
    namespace = kubernetes_namespace.kube-pilot-dev.metadata[0].name
  }

  spec {
    replicas = 3
    //... 
    // the spec for your container will be placed here
  }
}