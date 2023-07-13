variable "project_id" {
  description = "GCP project id"
  default     = "montreal-project-mcit"
  type = string
}

variable "config_yaml" {
    description = "Initial Settings"
    default     = "test.yaml"
    type        = string
}

variable "list_regions" {
  description   =   "Endpoints Regions"
  type          =   list(string) 
  default       =   ["northamerica-northeast1","us-central1"]
}