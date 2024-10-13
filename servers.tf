module "servers" {
  source = "./module"
  for_each = var.components
  env = var.env
  component_name = each.value["name"]
  instance_type = each.value["instance_type"]
  password = lookup(each.value, "password", "null" )
  
}
