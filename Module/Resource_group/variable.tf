variable "rg_name" {
  type = map(object(
    {
      name      = string            #name of resource group
      location  = string            #location where resource group will be created
      manged_by = optional(string)  #who will manage this(by terraform/portel)
      tag =optional(map(string))    #required tag
    }
  ))
}