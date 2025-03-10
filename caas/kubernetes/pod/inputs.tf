# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:caas", "provider:kubernetes", "resource:kubernetes-pod"]
}

# Global DataDog
variable "filter_tags_use_defaults" {
  description = "Use default filter tags convention"
  default     = "true"
}

variable "filter_tags_custom" {
  description = "Tags used for custom filtering when filter_tags_use_defaults is false"
  default     = "*"
}

variable "filter_tags_custom_excluded" {
  description = "Tags excluded for custom filtering when filter_tags_use_defaults is false"
  default     = ""
}

variable "filter_tags_separator" {
  description = "Set the filter tags separator (, or AND)"
  default     = ","
}

variable "message" {
  description = "Message sent when a monitor is triggered"
}

variable "evaluation_delay" {
  description = "Delay in seconds for the metric evaluation"
  default     = 15
}


variable "new_group_delay" {
  description = "Delay in seconds before monitor new resource"
  default     = 300
}

variable "timeout_h" {
  description = "Default auto-resolving state (in hours)"
  default     = 0
}

variable "prefix_slug" {
  description = "Prefix string to prepend between brackets on every monitors names"
  default     = ""
}

variable "notify_no_data" {
  description = "Will raise no data alert if set to true"
  default     = true
}

# Datadog monitors variables

variable "pod_phase_status_enabled" {
  description = "Flag to enable Pod phase status monitor"
  type        = string
  default     = "true"
}

variable "pod_phase_status_extra_tags" {
  description = "Extra tags for Pod phase status monitor"
  type        = list(string)
  default     = []
}

variable "pod_phase_status_message" {
  description = "Custom message for Pod phase status monitor"
  type        = string
  default     = ""
}

variable "pod_phase_status_time_aggregator" {
  description = "Monitor aggregator for Pod phase status [available values: min, max or avg]"
  type        = string
  default     = "max"
}

variable "pod_phase_status_timeframe" {
  description = "Monitor timeframe for Pod phase status [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_5m"
}

variable "error_enabled" {
  description = "Flag to enable Pod errors monitor"
  type        = string
  default     = "true"
}

variable "error_extra_tags" {
  description = "Extra tags for Pod errors monitor"
  type        = list(string)
  default     = []
}

variable "error_message" {
  description = "Custom message for Pod errors monitor"
  type        = string
  default     = ""
}

variable "error_time_aggregator" {
  description = "Monitor aggregator for Pod errors [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "error_timeframe" {
  description = "Monitor timeframe for Pod errors [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "error_threshold_critical" {
  default     = 0.5
  description = "error critical threshold"
}

variable "error_threshold_warning" {
  default     = 0
  description = "error warning threshold"
}

variable "terminated_enabled" {
  description = "Flag to enable Pod terminated monitor"
  type        = string
  default     = "true"
}

variable "terminated_extra_tags" {
  description = "Extra tags for Pod terminated monitor"
  type        = list(string)
  default     = []
}

variable "terminated_message" {
  description = "Custom message for Pod terminated monitor"
  type        = string
  default     = ""
}

variable "terminated_time_aggregator" {
  description = "Monitor aggregator for Pod terminated [available values: min, max or avg]"
  type        = string
  default     = "sum"
}

variable "terminated_timeframe" {
  description = "Monitor timeframe for Pod terminated [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_10m"
}

variable "terminated_threshold_critical" {
  default     = 0.5
  description = "terminated critical threshold"
}

variable "terminated_threshold_warning" {
  default     = 0
  description = "terminated warning threshold"
}

# Pod container killed by OOM
variable "pod_container_killed_by_oom_enabled" {
  description = "Flag to enable Pod container killed by OOM monitor"
  type        = string
  default     = "true"
}

variable "pod_container_killed_by_oom_message" {
  description = "Custom message for Pod container killed by OOM monitor"
  type        = string
  default     = ""
}

variable "pod_container_killed_by_oom_time_aggregator" {
  description = "Monitor aggregator for Pod container killed by OOM [available values: min, max or avg]"
  type        = string
  default     = "avg"
}

variable "pod_container_killed_by_oom_timeframe" {
  description = "Monitor timeframe for Pod container killed by OOM [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "pod_container_killed_by_oom_threshold_warning" {
  description = "Pod container killed by OOM warning threshold"
  type        = number
  default     = 0
}

variable "pod_container_killed_by_oom_threshold_critical" {
  description = "Pod container killed by OOM critical threshold"
  type        = number
  default     = 5
}

variable "pod_container_killed_by_oom_extra_tags" {
  description = "Extra tags for Pod container killed by OOM monitor"
  type        = list(string)
  default     = []
}

# Pod frequently restarted
variable "pod_frequently_restarted_enabled" {
  description = "Flag to enable Pod frequently restarted monitor"
  type        = string
  default     = "true"
}

variable "pod_frequently_restarted_message" {
  description = "Custom message for Pod frequently restarted monitor"
  type        = string
  default     = ""
}

variable "pod_frequently_restarted_time_aggregator" {
  description = "Monitor aggregator for Pod frequently restarted [available values: min, max or avg]"
  type        = string
  default     = "min"
}

variable "pod_frequently_restarted_timeframe" {
  description = "Monitor timeframe for Pod frequently restarted [available values: `last_#m` (1, 5, 10, 15, or 30), `last_#h` (1, 2, or 4), or `last_1d`]"
  type        = string
  default     = "last_15m"
}

variable "pod_frequently_restarted_threshold_warning" {
  description = "Pod frequently restarted warning threshold"
  type        = number
  default     = 5
}

variable "pod_frequently_restarted_threshold_critical" {
  description = "Pod frequently restarted critical threshold"
  type        = number
  default     = 10
}

variable "pod_frequently_restarted_extra_tags" {
  description = "Extra tags for Pod frequently restarted monitor"
  type        = list(string)
  default     = []
}

# General filter tags
variable "pod_group_by" {
  default     = ["kube_namespace", "pod_name", "reason", "kube_cluster_name"]
  description = "Select group by element on monitors (error and terminated)"
}

variable "pod_status_group_by" {
  default     = ["pod_name", "kube_namespace", "kube_cluster_name"]
  description = "Select group by element on monitors (phase status)"
}
