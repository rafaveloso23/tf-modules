resource "azurerm_resource_group" "example" {
  name     = "example-resources-aks"
  location = "east us"
}

resource "azurerm_container_registry" "example" {
  name                = "rvsacrtestrvs"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = var.cluster_name
  location            = azurerm_resource_group.example.location
  azure_policy_enabled = true
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "examplrvs"
  #kubernetes_version  = "1.26.3"
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_role_assignment" "example" {
  principal_id                     = azurerm_kubernetes_cluster.example.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.example.id
  skip_service_principal_aad_check = true
}

resource "null_resource" "get_kubeconfig" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_resource_group.example.name} --name ${azurerm_kubernetes_cluster.example.name} --overwrite-existing"
  }

  depends_on = [azurerm_kubernetes_cluster.example]
}
