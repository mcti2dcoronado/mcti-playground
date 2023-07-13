locals {
  avengers = ["sami", "olarewaju", "arunthavar","ajebit","jade","oladipupo","douglass"]
  
  regions = ["north","east",3,"west"]

  list_regions = toset(local.regions)

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

resource "null_resource" "strengths" {
  for_each = local.strengths
  triggers = {
    name  = each.key
    power = each.value
  }
}

output "strengths" {
  value = null_resource.strengths
}

output "list_regions" {
  value = local.list_regions
}

output "regions" {
    value = local.regions
}
