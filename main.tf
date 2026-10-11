resource "azuredevops_branch_policy_min_reviewers" "branch_policy_min_reviewers" {
  for_each = var.branch_policy_min_reviewers

  project_id = each.value.project_id
  blocking   = each.value.blocking
  enabled    = each.value.enabled

  settings {
    allow_completion_with_rejects_or_waits = each.value.settings.allow_completion_with_rejects_or_waits
    last_pusher_cannot_approve             = each.value.settings.last_pusher_cannot_approve
    on_each_iteration_require_vote         = each.value.settings.on_each_iteration_require_vote
    on_last_iteration_require_vote         = each.value.settings.on_last_iteration_require_vote
    on_push_reset_all_votes                = each.value.settings.on_push_reset_all_votes
    on_push_reset_approved_votes           = each.value.settings.on_push_reset_approved_votes
    reviewer_count                         = each.value.settings.reviewer_count
    dynamic "scope" {
      for_each = each.value.settings.scope
      content {
        match_type     = scope.value.match_type
        repository_id  = scope.value.repository_id
        repository_ref = scope.value.repository_ref
      }
    }
    submitter_can_vote = each.value.settings.submitter_can_vote
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

