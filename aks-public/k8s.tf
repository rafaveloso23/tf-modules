# resource "kubernetes_namespace" "dev" {
#   metadata {
#     annotations = {
#       environment = "dev"
#     }

#     labels = {
#       env = "dev"
#     }

#     name = "dev"
#   }
#   depends_on = [time_sleep.wait_5_min]
# }

# resource "kubernetes_namespace" "prd" {
#   metadata {
#     annotations = {
#       environment = "prd"
#     }

#     labels = {
#       env = "prd"
#     }

#     name = "prd"
#   }
#   depends_on = [time_sleep.wait_5_min]
# }

# resource "kubernetes_namespace" "qa" {
#   metadata {
#     annotations = {
#       environment = "qa"
#     }

#     labels = {
#       env = "qa"
#     }

#     name = "qa"
#   }
#   depends_on = [time_sleep.wait_5_min]
# }

# ####################################################################################
# ######################Time Sleep####################################################

# resource "time_sleep" "wait_5_min" {
#   depends_on = [azurerm_kubernetes_cluster.example]

#   create_duration = "5m"
# }
