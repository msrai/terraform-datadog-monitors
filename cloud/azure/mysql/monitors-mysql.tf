resource "datadog_monitor" "mysql_cpu_usage" {
  count   = var.cpu_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql ${title(var.server_type)} Server CPU usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.cpu_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.cpu_usage_time_aggregator}(${var.cpu_usage_timeframe}): (
      avg:azure.${local.metric_namespace}.cpu_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.cpu_usage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.cpu_usage_threshold_critical
    warning  = var.cpu_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.cpu_usage_extra_tags)
}

resource "datadog_monitor" "mysql_free_storage" {
  count   = var.free_storage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql ${title(var.server_type)} Server storage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.free_storage_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.free_storage_time_aggregator}(${var.free_storage_timeframe}): (
      100 - avg:azure.${local.metric_namespace}.storage_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) < ${var.free_storage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.free_storage_threshold_critical
    warning  = var.free_storage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.free_storage_extra_tags)
}

resource "datadog_monitor" "mysql_io_consumption" {
  count   = var.io_consumption_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql ${title(var.server_type)} Server IO consumption {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.io_consumption_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.io_consumption_time_aggregator}(${var.io_consumption_timeframe}): (
      avg:azure.${local.metric_namespace}.io_consumption_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.io_consumption_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.io_consumption_threshold_critical
    warning  = var.io_consumption_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.io_consumption_extra_tags)
}

resource "datadog_monitor" "mysql_memory_usage" {
  count   = var.memory_usage_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] Mysql ${title(var.server_type)} Server memory usage {{#is_alert}}{{{comparator}}} {{threshold}}% ({{value}}%){{/is_alert}}{{#is_warning}}{{{comparator}}} {{warn_threshold}}% ({{value}}%){{/is_warning}}"
  message = coalesce(var.memory_usage_message, var.message)
  type    = "query alert"

  query = <<EOQ
    ${var.memory_usage_time_aggregator}(${var.memory_usage_timeframe}): (
      avg:azure.${local.metric_namespace}.memory_percent${module.filter-tags.query_alert} by {resource_group,region,name}
    ) > ${var.memory_usage_threshold_critical}
EOQ

  monitor_thresholds {
    critical = var.memory_usage_threshold_critical
    warning  = var.memory_usage_threshold_warning
  }

  evaluation_delay    = var.evaluation_delay
  new_group_delay     = var.new_group_delay
  notify_no_data      = false
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = var.timeout_h
  include_tags        = true
  require_full_window = false
  priority            = var.priority

  tags = concat(local.common_tags, var.tags, var.memory_usage_extra_tags)
}
