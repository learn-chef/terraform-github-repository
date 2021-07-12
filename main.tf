module "repository" {
  for_each = { for repo in var.repository : repo.name => repo }
  source   = "./modules/repository"

  name       = replace(each.value.name, " ", "-")
  course_url = each.value.course_url
}
