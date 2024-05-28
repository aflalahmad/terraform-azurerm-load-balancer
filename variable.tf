variable "lbname" {
  type = string
  description = "This is the load balancer name."
  validation {
    condition     = length(var.lb_name) > 0
    error_message = "The load balancer name must not be empty."
  }
}
variable "resourcegroup_name" {
    type = string
    description = "This is the resource group name"
    validation {
    condition     = length(var.resourcegroup_name) > 0
    error_message = "The resource group name must not be empty."
  }
  
}
variable "location" {
  type = string
 description = "The location/region where the public IP is created"
     validation {
    condition     = length(var.location) > 0
    error_message = "The location must not be empty."
  }
  }
variable "frontend_ip_configuration" {
  type = map(object({
    name                 = string
    public_ip_address_id = string
  }))
  description = "Configuration for the frontend IP of the load balancer"
  default     = {}

  validation {
    condition     = can(var.frontend_ip_configuration) && length(keys(var.frontend_ip_configuration)) > 0
    error_message = "Frontend IP configuration must be provided and must not be empty."
  }

  validation {
    condition     = can(var.frontend_ip_configuration) && can(var.frontend_ip_configuration["example"]) && length(var.frontend_ip_configuration["example"].name) > 0
    error_message = "Frontend IP configuration 'name' must be provided and must not be empty."
  }

  validation {
    condition     = can(var.frontend_ip_configuration) && can(var.frontend_ip_configuration["example"]) && length(var.frontend_ip_configuration["example"].public_ip_address_id) > 0
    error_message = "Frontend IP configuration 'public_ip_address_id' must be provided and must not be empty."
  }
}


variable "tags" {
  type = map(string)
  default = {
  }
    description = "A map of tags to assign to the resource"

}