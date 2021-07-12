
variable "name" {
  type = string
}

variable "course_url" {
  type = string
}

variable "additional_topics" {
  type    = list(string)
  default = []
}

locals {
  default_topics = ["learn-chef-course", "terraform-managed", "chef"]
  topics         = distinct(compact(concat(local.default_topics, var.additional_topics)))

  // Remove spaces and colons from the course names
  name_without_space = replace(var.name, " ", "-")
  name_without_colon = replace(local.name_without_space, ":", "-")
  name               = local.name_without_colon
}
