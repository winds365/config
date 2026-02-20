#!/sbin/openrc-run

name="Hysteria"
description="Hysteria Server Service (config.yaml)"

supervisor=supervise-daemon
respawn_delay=5
respawn_max=2
respawn_period=600

capabilities="^cap_net_bind_service,^cap_net_admin,^cap_net_raw"

command="/usr/local/bin/hysteria"
command_args="server --config /etc/hysteria/config.yaml"
command_user="nobody:nobody"
command_background="yes"
output_log="/var/log/hysteria/access.log"
error_log="/var/log/hysteria/error.log"

depend() {
	need net
}
