provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "app_rg" {
  name     = "flask-app-rg"
  location = "Central India"
}

resource "azurerm_container_registry" "app_acr" {
  name                = "flaskazureapp"
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  sku                 = "Basic"
}

resource "azurerm_kubernetes_cluster" "app_aks" {
  name                = "flask-app-cluster"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  dns_prefix          = "flaskapp"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = "flask-postgres-db"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  sku_name            = "GP_Standard_D4s_v3"
  administrator_login = "adminuser"
  administrator_password = "Password123!"

  storage_mb = 32768
  version    = "14"
  zone       = "1"
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.app_aks.name
}

output "acr_login_server" {
  value = azurerm_container_registry.app_acr.login_server
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}
