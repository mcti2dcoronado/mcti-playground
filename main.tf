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

# Working with duplicates, using flatten and distinct

  paths_list = [
    "getData",
    "putData",
    "postData",
    "deleteData"
  ]

  regions_list = [
    "northamerica-northeast1",
    "us-central1"
]

  list = distinct(flatten([ for region in local.regions_list : [
                    for path in local.paths_list : {
                        region = region
                        path = path
                    }
  ]]))

  # split a word, using separator "-", check the index 0-1
  word_separate = lower(split("-", "backend-getData")[1])

  # Fetch data from yaml file
functions_list_temp = yamldecode(file("${path.root}/test.yaml"))["cloud_functions_list"]

  functions_list = flatten([ 
    for entry in local.functions_list_temp :
    {
        name        = lower(entry.name)
        neg_name    = lower("${terraform.workspace}-${entry.name}-neg")
    }
  ])

  # Using join
  list2_regions = join(", ", [for s in ["northamerica-northeast1","us-central1"]  : format("%s", s)])

# Working with a map list
  provinces_canada = {
    ontario = {
      name = "Ontario"
      population = 19065.3
    }
    quebec = {
        name = "Quebec"
        population = 9472.3
      }
  }
}

# Note: local.avangers is a list of strings, so we need to convert into a set
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

# Working with duplicates - output
output "list" {
    value = local.list
}

# split a word - output
output "word_separate" {
    value = local.word_separate
}

# fetch data from yaml file
output "yaml_output" {
    value = local.functions_list
}

# using join output
output "list2_regions" {
    value = local.list2_regions
}