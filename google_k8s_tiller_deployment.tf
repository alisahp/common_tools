resource "null_resource" "helm_init" {
  depends_on = [
    "kubernetes_service_account.tiller",
    "kubernetes_secret.tiller",
    "kubernetes_cluster_role_binding.tiller_cluster_rule"
  ]
  provisioner "local-exec" {
    command = <<EOF
    kubectl delete deploy -n kube-system  tiller-deploy || echo "Already Deleted from Kubernetes Cluster"
    helm init --service-account ${kubernetes_service_account.tiller.metadata.0.name} --tiller-namespace ${kubernetes_service_account.tiller.metadata.0.namespace}
    EOF
  }
}

## Service account for tiller
resource "kubernetes_service_account" "tiller" {
  metadata {
    name      = "tiller"
    namespace = "${var.tiller_namespace}"
  }
  secret {
    name = "${kubernetes_secret.tiller.metadata.0.name}"
  }
  automount_service_account_token = true
}

## Secret for tillers service account
resource "kubernetes_secret" "tiller" {
  metadata {
    name      = "tiller"
    namespace = "${var.tiller_namespace}"
  }
}

## Cluster role binding for tiller
resource "kubernetes_cluster_role_binding" "tiller_cluster_rule" {
    depends_on = [
      "kubernetes_service_account.tiller",
      "kubernetes_secret.tiller"
    ]
    metadata {
        name = "tiller-cluster-rule"
    }
    role_ref {
        api_group = "rbac.authorization.k8s.io"
        kind      = "ClusterRole"
        name      = "cluster-admin"
    }
    subject {
        kind      = "ServiceAccount"
        name      = "${kubernetes_service_account.tiller.metadata.0.name}"
        namespace = "${kubernetes_service_account.tiller.metadata.0.namespace}"
    }
}
