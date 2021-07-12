# terraform-github-repository

Repository management for the Learn Chef GitHub organisation.

## Usage

To create a new repository add it to the list of repository objects inside `terraform.tfvars.json`

These repository objects have a number of properties available which can be used:

| property            | description                         |
| ------------------- | ----------------------------------- |
| `name`              | The name of the repo                |
| `additional_topics` | Add additional topics to the repo   |
| `course_url`        | URL to the about page of the course |

Additional topics allows you to categorise the repositories further. For example to add the Learn Chef section the course is in add:

```json
"additional_topics": ["chef-software-a-guided-tour"]
```

*note* Additional topics must have no hyphens or spaces.

## Importing a Repo

- Add repository to `terraform.tfvars.json`
- import the state file using:

  ```bash
  terraform import module.repository[\"Beginning Your Chef Journey\"].github_repository.this beginning-your-chef-journey
  terraform import module.repository[\"Beginning Your Chef Journey\"].github_branch.default beginning-your-chef-journey:main
  terraform import module.repository[\"Beginning Your Chef Journey\"].github_branch_protection.default beginning-your-chef-journey:main
  ```
