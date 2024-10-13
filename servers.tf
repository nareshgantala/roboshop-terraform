module "servers" {
  for_each = var.components  
  source = "./module"
  component_name = each.value["name"]
  components = var.components
  env = var.env
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null" )
  
}
