resource "kubernetes_namespace" "taas-sv-ns" {
  metadata {
    annotations = {
      name = "taas-sv-ns"
    }

    labels = {
      app = "sv-app"
    }

    name = "taas-sv-ns"
  }
}

resource "kubernetes_namespace" "taas-pt-ns" {
  metadata {
    annotations = {
      name = "taas-pt-ns"
    }

    labels = {
      app = "pt-app"
    }

    name = "taas-pt-ns"
  }
}

resource "kubernetes_namespace" "taas-at-ns" {
  metadata {
    annotations = {
      name = "taas-at-ns"
    }

    labels = {
      app = "at-app"
    }

    name = "taas-at-ns"
  }
}


