resource "null_resource" "append_to_kubeconfig" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo '${azurerm_kubernetes_cluster.example.kube_config_raw}' >> $HOME/.kube/config"
  }
  lifecycle {
    ignore_changes = [ triggers ]
  }

  depends_on = [ azurerm_kubernetes_cluster.example ]
}