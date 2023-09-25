output "avengers" {
  value = null_resource.avengers
  description = "Display the list of strings"
}

output "strengths" {
  value = null_resource.strengths
}

output "provinces" {
  value = [ for province in local.provinces_canada: province => population ]

}