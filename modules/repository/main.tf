resource "github_repository" "this" {
  name         = "course-${local.name}"
  description  = var.course_url
  homepage_url = var.course_url

  visibility             = "public"
  has_issues             = true
  has_projects           = false
  has_wiki               = false
  has_downloads          = false
  allow_merge_commit     = false
  allow_rebase_merge     = false
  allow_squash_merge     = true
  delete_branch_on_merge = true
  archived               = false
  topics                 = local.topics
  auto_init              = true
  license_template       = "apache-2.0"
  archive_on_destroy     = true
  vulnerability_alerts   = false
}


resource "github_branch_default" "default" {
  repository = github_repository.this.name
  branch     = "main"
}

resource "github_branch_protection" "default" {
  repository_id = github_repository.this.name
  pattern       = "main"
  depends_on    = [github_repository.this]
}
