output "branch_policy_min_reviewers_id" {
  description = "Map of id values across all branch_policy_min_reviewers, keyed the same as var.branch_policy_min_reviewers"
  value       = { for k, v in azuredevops_branch_policy_min_reviewers.branch_policy_min_reviewers : k => v.id }
}
output "branch_policy_min_reviewers_blocking" {
  description = "Map of blocking values across all branch_policy_min_reviewers, keyed the same as var.branch_policy_min_reviewers"
  value       = { for k, v in azuredevops_branch_policy_min_reviewers.branch_policy_min_reviewers : k => v.blocking }
}
output "branch_policy_min_reviewers_enabled" {
  description = "Map of enabled values across all branch_policy_min_reviewers, keyed the same as var.branch_policy_min_reviewers"
  value       = { for k, v in azuredevops_branch_policy_min_reviewers.branch_policy_min_reviewers : k => v.enabled }
}
output "branch_policy_min_reviewers_project_id" {
  description = "Map of project_id values across all branch_policy_min_reviewers, keyed the same as var.branch_policy_min_reviewers"
  value       = { for k, v in azuredevops_branch_policy_min_reviewers.branch_policy_min_reviewers : k => v.project_id }
}
output "branch_policy_min_reviewers_settings" {
  description = "Map of settings values across all branch_policy_min_reviewers, keyed the same as var.branch_policy_min_reviewers"
  value       = { for k, v in azuredevops_branch_policy_min_reviewers.branch_policy_min_reviewers : k => one(v.settings) }
}

