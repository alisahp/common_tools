## FuchiCorp Vault Deployment
resource "kubernetes_deployment" "vault_deployment" {
  depends_on = ["kubernetes_namespace.service_tools"]
  depends_on = ["kubernetes_secret.vault_secret"]

  metadata {
    name = "vault-deployment"

    namespace = "${var.deployment_environment}"

    labels {
      app = "vault-deployment"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "vault-deployment"
      }
    }

    template {
      metadata {
        labels {
          app = "vault-deployment"
        }
      }

      spec {
        volume {
          name = "vault-pvc"

          persistent_volume_claim {
            claim_name = "vault-pvc"
          }
        }

        container {
          name  = "vault"
          image = "vault"

          port {
            container_port = 8200
            protocol       = "TCP"
          }

          security_context {
            capabilities {
              add = ["IPC_LOCK"]
            }
          }

          env {
            name = "VAULT_DEV_ROOT_TOKEN_ID"

            value_from {
              secret_key_ref {
                name = "vault-secret"
                key  = "token"
              }
            }
          }

          volume_mount {
            name       = "vault-pvc"
            mount_path = "/var/run"
          }
        }
      }
    }
  }
}

## Vault Persistent Volume Claim
resource "kubernetes_persistent_volume_claim" "vault_pvc" {
  depends_on = [
    "kubernetes_namespace.service_tools",
    "kubernetes_secret.vault_secret" ]

  metadata {
    name = "vault-pvc"

    namespace = "${var.deployment_environment}"

    labels {
      app = "vault-deployment"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests {
        storage = "1Gi"
      }
    }
  }
}

## FuchiCorp vault secret
resource "kubernetes_secret" "vault_secret" {
  depends_on = ["kubernetes_namespace.service_tools"]
  metadata {
    name = "vault-secret"

    namespace = "${var.deployment_environment}"
  }

  data {
    token = "${var.vault_token}"
  }

  type = "Opaque"
}

resource "kubernetes_service" "vault_service" {
  depends_on = ["kubernetes_namespace.service_tools"]
  depends_on = ["kubernetes_secret.vault_secret"]

  metadata {
    name = "vault-service"

    namespace = "${var.deployment_environment}"
  }

  spec {
    selector {
      app = "vault-deployment"
    }

    port {
      protocol    = "TCP"
      port        = "${var.vault_service_port}"
      target_port = 8200
    }

    type = "ClusterIP"
  }
}
