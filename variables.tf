variable "repository" {
  description = "The repositories to create."

  type = list(object({
    name              = string
    course_url        = string
    additional_topics = optional(list(string))
  }))
}
