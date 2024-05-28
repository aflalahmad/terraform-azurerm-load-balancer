<!-- BEGIN_TF_DOCS -->
# Azure Load Balancer Overview

Azure Load Balancer distributes incoming network traffic across multiple servers to ensure high availability and reliability for your applications. It works at Layer 4 of the OSI model and can route traffic based on various criteria, such as round-robin or least connections.

```hcl
resource "azurerm_lb" "example" {
  name                = var.lbname
  location            = var.location
  resource_group_name = var.resourcegroup_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration["example_frontend"]["name"]
    public_ip_address_id = var.frontend_ip_configuration["example_frontend"]["public_ip_address_id"]
  }
  
  tags = var.tags
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm)

## Resources

The following resources are used by this module:

- [azurerm_lb.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) (resource)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_lbname"></a> [lbname](#input\_lbname)

Description: This is the load balancer name.

Type: `string`

### <a name="input_location"></a> [location](#input\_location)

Description: The location/region where the public IP is created

Type: `string`

### <a name="input_resourcegroup_name"></a> [resourcegroup\_name](#input\_resourcegroup\_name)

Description: This is the resource group name

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_frontend_ip_configuration"></a> [frontend\_ip\_configuration](#input\_frontend\_ip\_configuration)

Description: Configuration for the frontend IP of the load balancer

Type:

```hcl
map(object({
    name                 = string
    public_ip_address_id = string
  }))
```

Default: `{}`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the resource

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_frontend_ip_configuration"></a> [frontend\_ip\_configuration](#output\_frontend\_ip\_configuration)

Description: Details of the frontend IP configuration

### <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id)

Description: The ID of the created Azure Load Balancer

## Modules

No modules.

---
**Note:** Thank you for reading. If you have any questions or need further assistance, please feel free to reach out.
<!-- END_TF_DOCS -->