#
class collectd (
  $fqdnlookup             = $collectd::params::fqdnlookup,
  $collectd_hostname      = $collectd::params::collectd_hostname,
  $interval               = $collectd::params::interval,
  $include                = $collectd::params::include,
  $purge                  = $collectd::params::purge,
  $purge_config           = $collectd::params::purge_config,
  $recurse                = $collectd::params::recurse,
  $threads                = $collectd::params::threads,
  $timeout                = $collectd::params::timeout,
  $typesdb                = $collectd::params::typesdb,
  $write_queue_limit_high = $collectd::params::write_queue_limit_high,
  $write_queue_limit_low  = $collectd::params::write_queue_limit_low,
  $config_file            = $collectd::params::config_file,
  $package_provider       = $collectd::params::provider,
  $package_name           = $collectd::params::package,
  $plugin_conf_dir        = $collectd::params::plugin_conf_dir,
  $root_group             = $collectd::params::root_group,
  $version                = $collectd::params::version,
  $service_name           = $collectd::params::service_name,
  $service_ensure         = $collectd::params::service_ensure,
  $service_enable         = $collectd::params::service_enable,
) inherits collectd::params {

  validate_bool($purge_config, $fqdnlookup)
  validate_array($include, $typesdb)

  class { 'collectd::install': } ->
  class { 'collectd::config': } ~>
  class { 'collectd::service': }

}
