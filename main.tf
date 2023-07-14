locals {

  # Working with a list of strings
  avengers = ["sami", "olarewaju", "arunthavar","ajebit","jade","oladipupo","douglass"]
  
  # Convert list of strings into set
  regions = ["north","east",3,"west"]
  list_regions = toset(local.regions)

  # Working with a map list
  strengths = {
    "sami"          = "Artificial Intelligence"
    "olarewaju"     = "Sheild"
    "arunthavar"    = "Muscle Power"
    "ajebit"        = "Martial Arts"
    "jade"          = "Hammer"
    "oladipupo"     = "Web"
    "douglass"      = "Vibranium suit"
  }

}


resource "null_resource" "avengers" {
  for_each = toset(local.avengers)
  triggers = {
    name = each.value
  }
}

# Note: for_each accepts map or set 
resource "null_resource" "strengths" {
  for_each = local.strengths
  triggers = {
    name  = each.key
    power = each.value
  }
}

# Convert list of strings into set - Output
output "list_regions" {
  value = local.list_regions
}

output "regions" {
    value = local.regions
}
