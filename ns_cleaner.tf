
resource "kubernetes_cron_job" "ns_cleaner_cronjob" {
  metadata {
    name = "ns-cleaner-cj"
    namespace = "${kubernetes_service_account.common_service_account.metadata.0.namespace}"
  }
  spec {
    successful_jobs_history_limit = 3
    failed_jobs_history_limit     = 1
    schedule                      = "55 23 * * 0"
    job_template {
      metadata {}
      spec {
        backoff_limit = 3
        template {
          metadata {}
          spec {
            automount_service_account_token = "true"
            service_account_name = "${kubernetes_service_account.common_service_account.metadata.0.name}"
            container {
              name    = "ns-cleaner"
              image   = "bitnami/kubectl:latest"
              command = ["/bin/sh", "-c", "kubectl delete `kubectl api-resources --namespaced=true --verbs=delete -o name | tr '\n' ',' | sed -e 's/,\\$//'` --all -n test"  ]
            }
            restart_policy = "OnFailure"
          }
        }
      }
    }
  }
}