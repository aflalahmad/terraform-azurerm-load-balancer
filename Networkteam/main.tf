terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 3.1.0"
    }
  }
  required_version = ">=1.1.0"
}
provider "azurerm" {
  features {
    
  }
}

data "azurerm_resource_group" "rg" {
  name = "dev-Homework2-rg"
}

data "azurerm_public_ip" "pubip" {
    name = "mypublicip"
    resource_group_name = data.azurerm_resource_group.rg.name
  
}
module "load-balancer" {
  source  = "aflalahmad/load-balancer/azurerm"
  version = "0.0.2"
  lbname = "lbteam1"
  resourcegroup_name = data.azurerm_resource_group.rg.name
  location = "Westus"
  frontend_ip_configuration = {
    example_frontend = {
        name = "myfrontendip"
        public_ip_address_id = data.azurerm_public_ip.pubip.id 
    }
  }
  tags = {
    Environment = "dev"
    Purpose = "homework"
  }
}