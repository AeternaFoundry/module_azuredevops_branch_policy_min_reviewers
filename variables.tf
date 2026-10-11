variable "branch_policy_min_reviewers" {
  description = <<EOT
Map of branch_policy_min_reviewers, attributes below
Required:
    - project_id
    - settings (block):
        - allow_completion_with_rejects_or_waits (optional)
        - last_pusher_cannot_approve (optional)
        - on_each_iteration_require_vote (optional)
        - on_last_iteration_require_vote (optional)
        - on_push_reset_all_votes (optional)
        - on_push_reset_approved_votes (optional)
        - reviewer_count (optional)
        - scope (required, block):
            - match_type (optional)
            - repository_id (optional)
            - repository_ref (optional)
        - submitter_can_vote (optional)
Optional:
    - blocking
    - enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    project_id = string
    blocking   = optional(bool)
    enabled    = optional(bool)
    settings = object({
      allow_completion_with_rejects_or_waits = optional(bool)
      last_pusher_cannot_approve             = optional(bool)
      on_each_iteration_require_vote         = optional(bool)
      on_last_iteration_require_vote         = optional(bool)
      on_push_reset_all_votes                = optional(bool)
      on_push_reset_approved_votes           = optional(bool)
      reviewer_count                         = optional(number)
      scope = list(object({
        match_type     = optional(string)
        repository_id  = optional(string)
        repository_ref = optional(string)
      }))
      submitter_can_vote = optional(bool)
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branch_policy_min_reviewers : (
        length(v.settings.scope) >= 1
      )
    ])
    error_message = "Each scope list must contain at least 1 items"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

