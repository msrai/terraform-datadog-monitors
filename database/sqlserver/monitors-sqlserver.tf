resource "datadog_monitor" "sqlserver_availability" {
  count   = var.sqlserver_availability_enabled == "true" ? 1 : 0
  name    = "${var.prefix_slug == "" ? "" : "[${var.prefix_slug}]"}[${var.environment}] SQL Server server does not respond"
  message = coalesce(var.sqlserver_availability_message, var.message)
  type    = "service check"

  query = <<EOQ
    "sqlserver.can_connect"${module.filter-tags.service_check}.by("port","server").last(6).count_by_status()
EOQ

  thresholds = {
    warning  = var.sqlserver_availability_threshold_warning
    critical = 5
  }

  no_data_timeframe   = var.sqlserver_availability_no_data_timeframe
  new_host_delay      = var.new_host_delay
  notify_no_data      = var.notify_no_data
  renotify_interval   = 0
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true

  tags = concat(["env:${var.environment}", "type:database", "provider:sqlserver", "resource:sqlserver", "team:claranet", "created-by:terraform"], var.sqlserver_availability_extra_tags)

  lifecycle {
    ignore_changes = [silenced]
  }
}
