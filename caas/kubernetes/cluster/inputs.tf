# Global variables
variable "tags" {
  type    = list(string)
  default = ["type:caas", "provider:kubernetes", "resource:kubernetes-node"]
}

# Datadog global variables
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

variable "apiserver_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 10
}

# Datadog monitors variables
## API server monitor variables
variable "apiserver_enabled" {
  description = "Flag to enable API server monitor (do not work on some clusters, see https://docs.datadoghq.com/containers/kubernetes/control_plane/?tab=datadogoperator#ManagedServices)"
  type        = string
  default     = "false"
}

variable "apiserver_extra_tags" {
  description = "Extra tags for API server monitor"
  type        = list(string)
  default     = []
}

variable "apiserver_message" {
  description = "Custom message for API server monitor"
  type        = string
  default     = ""
}

variable "apiserver_threshold_warning" {
  description = "API server monitor (warning threshold)"
  type        = string
  default     = 3
}

## Heartbeat monitor variables
variable "heartbeat_enabled" {
  description = "Flag to enable heartbeat monitor"
  type        = string
  default     = "true"
}

variable "heartbeat_message" {
  description = "Custom message for heartbeat monitor"
  type        = string
  default     = ""
}

variable "heartbeat_no_data_timeframe" {
  description = "Number of minutes before reporting no data"
  type        = string
  default     = 20
}

variable "heartbeat_time_aggregator" {
  description = "Time aggregator for heartbeat monitor"
  type        = string
  default     = "min"
}

variable "heartbeat_timeframe" {
  description = "Timeframe for heartbeat monitor"
  type        = string
  default     = "last_30m"
}

variable "heartbeat_extra_tags" {
  description = "Extra tags for heartbeat monitor"
  type        = list(string)
  default     = []
}
