STIG Cookbook
=============
Installs and configures the CIS CentOS Linux 6 benchmark.  
These sets of recipes aim to harden the operating system in order to pass all scored CIS benchmarks and optionally all unscored CIS benchmarks.

More information about CIS benchmarks may be found at http://benchmarks.cisecurity.org

Requirements
------------
### Platforms
- CentOS 6.x

### Cookbooks
- logrotate
- sysctl

### Suggests
- auditd, ~> 1.0.1

[Changelog](CHANGELOG.md)
---------

Attributes
----------
- `node['stig']['grub']['hashedpassword']` = The hashed grub password to use. Ex: openssl passwd -1 ChangeMe (String (MD5 Hash))

- `node['stig']['limits']` = A hash of items that go into /etc/security/limits.conf (Array of Hashes of Hashes)

- `node['stig']['auditd']` = See: [Auditd Configuration](http://linux.die.net/man/5/auditd.conf)

- `node['stig']['mount_disable']['cramfs']` = Disable cramfs filesystem (Boolean)
- `node['stig']['mount_disable']['freevxfs']` = Disable freevxfs filesystem (Boolean)
- `node['stig']['mount_disable']['jffs2']` = Disable jffs2 filesystem (Boolean)
- `node['stig']['mount_disable']['hfs']` = Disable hfs filesystem (Boolean)
- `node['stig']['mount_disable']['hfsplus']` = Disable hfsplus filesystem (Boolean)
- `node['stig']['mount_disable']['squashfs']` = Disable squashfs filesystem (Boolean)
- `node['stig']['mount_disable']['udf']` = Disable udf filesystem (Boolean)

- `node['stig']['mail_transfer_agent']['inet_interfaces']` = Configure Mail Transfer Agent for Local-Only Mode - If the system is intended to be a mail server, change from "localhost" (String)

- `node['stig']['network']['zeroconf']` = Disable Avahi Server (true = disabled, false = enabled) (Boolean)

- `node['stig']['network']['ip_forwarding']` = Disable IP Forwarding (true = enabled, false = disabled) (Boolean)

- `node['stig']['network']['packet_redirects']` = Disable Send Packet Redirects (true = enabled, false = disabled) (Boolean)

- `node['stig']['network']['icmp_redirect_accept']` = Disable ICMP Redirect Acceptance (true = enabled, false = disabled) (Boolean)

- `node['stig']['network']['icmp_all_secure_redirect_accept']` = Disable Secure ICMP Redirect Acceptance (true = enabled, false = disabled) (
Boolean)

- `node['stig']['network']['log_suspicious_packets']` = Log Suspicious Packets (true = enabled, false = disabled) (Boolean)

- `node['stig']['network']['rfc_source_route_validation']` = Enable RFC-recommended Source Route Validation (true = enabled, false = disabled) (Boolean)

- `node['stig']['network']['ipv6_redirect_accept']` = Disable IPv6 Redirect Acceptance (true = enabled, false = disabled) (Boolean)

- `node['stig']['network']['hosts_allow']` = Create /etc/hosts.allow - An array of &lt;net>/&lt;mask> combinations or 'ALL' (Array of String)

- `node['stig']['network']['hosts_deny']` = Create /etc/hosts.deny - An array of &lt;net>/&lt;mask> combinations or 'ALL' (Array of String)

- `node['stig']['network']['disable_dcpp']` = Disable DCCP (true = disable, false = enable) (Boolean)

- `node['stig']['network']['disable_sctp']` = Disable SCTP (true = disable, false = enable) (Boolean)

- `node['stig']['network']['disable_rds']` = Disable RDS (true = disable, false = enable) (Boolean)

- `node['stig']['network']['disable_tipc']` = Disable TIPC (true = disable, false = enable) (Boolean)

- `node['stig']['network']['ipv6']` = Disable IPV6 ("no" = disable, "yes" = enable) (String)

( See https://supermarket.chef.io/cookbooks/sysctl )
- `node['sysctl']['*']` = Sets configuration in sysctl config file. See default attributes.


- `node['stig']['logging']['rsyslog_rules']` = Configure /etc/rsyslog.conf - Include rules for logging in array with space separating rule with log location (Array of String)
- `node['stig']['logging']['rsyslog_rules_rhel']` = Configure /etc/rsyslog.conf for RHEL - Include rules for logging in array with space separating rule with log location (Array of String)
- `node['stig']['logging']['rsyslog_rules_debian']` = Configure /etc/rsyslog.conf for Debian - Include rules for logging in array with space separating rule with log location (Array of String)

- `node['stig']['selinux']['enabled']` = By default, SELinux is enabled. However, there may be reasons to shut it off (Boolean)
- `node['stig']['selinux']['status']` = Possible values: enforcing, permissive (String)
- `node['stig']['selinux']['type']` = Possible values: targeted, mls (String)


- `node['stig']['sshd_config']['allow_agent_forwarding']` =  (String) Specifies whether ssh-agent forwarding is permitted. Default: 'yes'
- `node['stig']['sshd_config']['allow_tcp_forwarding']` =  Specifies whether TCP forwarding is permitted. Default: yes (String)
- `node['stig']['sshd_config']['allow_users_set_env_opts']` = (String) Allow Users to Set Environment Options. Default: 'no'
- `node['stig']['sshd_config']['authentication_methods']` =  Specifies the authentication methods that must be successfully completed for a
user to be granted access.This option must be followed by one or more comma-separated
lists ofauthentication method names.Successful authentication requires completion
of every method in at leastone of these lists.
This option is only available for SSH protocol 2. Default: [] (Array, String)
- `node['stig']['sshd_config']['authorized_keys_command']` = Specifies a program to be used to look up the user's public keys. Default: '' (String)
- `node['stig']['sshd_config']['authorized_keys_command_user']` = Specifies the user under whose account the AuthorizedKeysCommand is run.It is recommended to use a dedicated user that has no other role on the hostthan running authorized keys commands. Default: '' (String)
- `node['stig']['sshd_config']['authorized_keys_file']` = Specifies the file that contains the public keys that can be used for user authentication. Default: '.ssh/authorized_keys' (String)
- `node['stig']['sshd_config']['authorized_keys_command_run_as']` = Specifies the user under whose account the AuthorizedKeysCommand is run. Default: '' (String)
- `node['stig']['sshd_config']['authorized_principals_file']` = Specifies a file that lists principal names that are accepted for certificate authentication. Default: 'none' (String)
- `node['stig']['sshd_config']['chroot_directory']` = Specifies the pathname of a directory to chroot to after authentication. Default: 'none' (String)
- `node['stig']['sshd_config']['client_alive_count_max']` = Sets the number of client alive messages which may besent without sshd receiving any messages back from the client. Default: '3' (String)
- `node['stig']['sshd_config']['client_alive_interval']` = Sets a timeout interval in seconds after which if no data has been received from the client. Default: '0' (String)
- `node['stig']['sshd_config']['compression']` = Specifies whether compression is allowed, or delayed untilt he user has authenticated successfully. The argument must be 'yes' 'delayed' or 'no'. Default: 'delayed' (String)
- `node['stig']['sshd_config']['force_command']` = Forces the execution of the command specified by ForceCommand ignoring any command supplied by the client and ~/.ssh/rc if present. Default: '' (String)
- `node['stig']['sshd_config']['gateway_ports']` = Specifies whether remote hosts are allowed to connect to ports forwarded for the client. (String), Default: 'no'
- `node['stig']['sshd_config']['gss_api_authentication']` = (String) Specifies whether user authentication based on GSSAPI is allowed. Note that this option applies to protocol version 2 only. Default: 'no'
- `node['stig']['sshd_config']['gss_api_key_exchange']` = (String) Allow GSSAPI user authentication using the 'gssapi-with-mic' mechanism. Default: 'no'
- `node['stig']['sshd_config']['gss_cleanup_credentials']` = (String) Specifies whether to automatically destroy the user's credentials cache on logout. Default: 'yes'
- `node['stig']['sshd_config']['gss_api_store_credentials_on_rekey']` = (String) Controls whether the user's GSSAPI credentials should be updated following a successful connection rekeying. Default: 'no'
- `node['stig']['sshd_config']['gss_api_strict_acceptor_check']` = (String) Determines whether to be strict about the identity of the GSSAPI acceptor a client authenticates against. Default: 'yes'
- `node['stig']['sshd_config']['host_based_auth']` = (String) Specifies whether rhosts or /etc/hosts.equiv authentication together with successful public key client host authentication is allowed (host-based authentication). Default: 'no'
- `node['stig']['sshd_config']['host_based_uses_name_from_packet_only']` = (String) Specifies whether or not the server will attempt to perform a reversename lookup when matching the name in the ~/.shosts ~/.rhosts and/etc/hosts.equiv files during HostbasedAuthentication, Default: 'no'
- `node['stig']['sshd_config']['host_certificate']` = Specifies a file containing a public host certificate (String), Default: ''
- `node['stig']['sshd_config']['ignore_rhosts']` = (String) Specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthenticationorHostbasedAuthentication, Default: 'yes'
- `node['stig']['sshd_config']['ignore_user_known_hosts']` = (String) Specifies whether sshd should ignore the user's ~/.ssh/known_hosts during RhostsRSAAuthenticationorHostbasedAuthentication. Default: 'no'
- `node['stig']['sshd_config']['kerberos_authentication']` = (String) Specifies whether the password provided by the user for PasswordAuthentication will be validated through the Kerberos KDC, Default: 'no'
- `node['stig']['sshd_config']['kerberos_or_local_passwd']` = (String) If set then if password authentication through Kerberos fails then the password will be validated via any additional local mechanism such as /etc/passwd, Default: 'yes'
- `node['stig']['sshd_config']['kerberos_ticket_cleanup']` = (String) Specifies whether to automatically	destroy	the user's ticket cache file on logout. Default: 'yes'
- `node['stig']['sshd_config']['kerberos_use_kuserok']` = (String) Specifies whether to look at .k5login file for user's aliases. Default: 'yes'
- `node['stig']['sshd_config']['key_regeneration_interval']` = In protocol version 1, the	ephemeral server key is	automatically regenerated after this many seconds (if it	has been used). (String), Default: '3600'
- `node['stig']['sshd_config']['login_grace_time']` = The server disconnects after this time if the user has not	successfully logged in. (String), Default: '120'
- `node['stig']['sshd_config']['log_level']` = Gives the verbosity level that is used when logging messages from sshd. Default: INFO (String)
- `node['stig']['sshd_config']['macs']` = Specifies the available MAC (message authentication code) algorithms. Default: 'hmac-md5,hmac-sha1,hmac-ripemd160,hmac-sha1-96,hmac-md5-96' (String)
- `node['stig']['sshd_config']['max_startups']` = Specifies the maximum number of concurrent	unauthenticated	connections to the sshd daemon. Default: '10:30:60' (String)
- `node['stig']['sshd_config']['max_auth_tries']` = SSHd Max auth tries (Integer)
- `node['stig']['sshd_config']['max_sessions']` = Specifies the maximum number of open sessions permitted per network connection (String), Default: '10'
- `node['stig']['sshd_config']['password_authentication']` = (String) Specifies whether password authentication is allowed. Default: 'yes'
- `node['stig']['sshd_config']['port']` = SSHd daemon port. Default: ['22'] (Array, String)
- `node['stig']['sshd_config']['permit_root_login']` = (String) Allow SSH root login. Default: 'no'
- `node['stig']['sshd_config']['permit_empty_passwords']` = (String) Allow SSH to permit empty passwords. Default: 'no'
- `node['stig']['sshd_config']['pid_file']` = Specifies the file	that contains the process ID of	the sshd daemon (String), Default: '/var/run/sshd.pid'
- `node['stig']['sshd_config']['print_last_log']` = (String) Specifies whether sshd should print the date and time when	the user last logged in. Default: 'yes'
- `node['stig']['sshd_config']['print_motd']` = (String) Specifies whether sshd should print /etc/motd when	a user logs in interactively. Default: 'yes'
- `node['stig']['sshd_config']['protocol']` = Specifies the protocol versions sshd supports. (String), Default: '2'
- `node['stig']['sshd_config']['pub_key_authentication']` = (String) Specifies whether public key authentication is allowed. Note that this option	applies	to protocol version 2 only. Default: 'yes'
- `node['stig']['sshd_config']['rhosts_rsa_authentication']` =(String) Specifies whether rhosts or /etc/hosts.equiv authentication. This option applies to	protocol version 1 only. Default: 'no'
- `node['stig']['sshd_config']['rsa_authentication']` = (String) Specifies whether pure RSA authentication is allowed. This option applies to	protocol version 1 only. Default: 'no'
- `node['stig']['sshd_config']['server_key_bits']` = Defines the number	of bits	in the ephemeral protocol version 1 server key. This option applies to	protocol version 1 only. (String), Default: '768'
- `node['stig']['sshd_config']['show_patch_level']` = (String) Specifies whether sshd will display the patch level of the binary in the identification string This option applies to	protocol version 1 only. Default: 'no'
- `node['stig']['sshd_config']['strict_modes']` = (String) Specifies whether sshd should check file modes and	ownership of the user's files and home directory before	accepting login. Default: 'yes'
- `node['stig']['sshd_config']['subsystem']` = Configures	an external subsystem (e.g., file transfer daemon). (String), Default: 'sftp	/usr/libexec/openssh/sftp-server'
- `node['stig']['sshd_config']['syslog_facility']` = Gives the facility	code that is used when logging messages	from sshd. (String), Default: 'AUTHPRIV'
- `node['stig']['sshd_config']['tcp_keepalive']` = (String) Specifies whether the system should send TCP keepalive messages to	the other side. Default: 'yes'
- `node['stig']['sshd_config']['use_dns']` = (String) Specifies whether sshd should lookup the remote host name and check that	the resolved host name for the remote IP address maps back to the very same IP address. Default: 'no'
- `node['stig']['sshd_config']['use_login']` = (String) Specifies whether login is used	for interactive	login sessions. Default: 'no'
- `node['stig']['sshd_config']['use_privilege_separation']` = (String) Specifies whether sshd separates privileges by creating an unprivileged child	process	to deal	with incoming network traffic. Default: 'yes'
- `node['stig']['sshd_config']['version_addendum']` = Specifies a string	to append to the regular version string	to identify OS- or site-specific modifications (String), Default: ''
- `node['stig']['sshd_config']['x_11_display_offset']` = Specifies the first display number	available for sshd's X11 forwarding. (Integer), Default: 10
- `node['stig']['sshd_config']['x_11_forwarding']` = (String) Specifies whether X11 forwarding is permitted. Default: 'yes'
- `node['stig']['sshd_config']['x_11_use_local_host']` = (String) Specifies whether sshd should bind	the X11	forwarding server to the loopback address or to	the wildcard address. Default: 'yes'
- `node['stig']['sshd_config']['x_auth_location']` = Specifies the full	pathname of the	xauth program (String), Default: ''
- `node['stig']['sshd_config']['banner_path']` = Set SSH login banner path (String)
- `node['stig']['sshd_config']['deny_users']` = List of users to deny SSH login to (Array of String)
- `node['stig']['sshd_config']['accept_env']` = Specifies what environment variables sent by the client will be copied into the session's environ. See: https://www.freebsd.org/cgi/man.cgi?query=environ&sektion=7&apropos=0&manpath=FreeBSD+11.0-RELEASE+and+Ports (Array, String), Default: Multiple
- `node['stig']['sshd_config']['address_family']` = Specifies which address family should be used by sshd(8). Valid arguments are 'any', 'inet' (use IPv4 only), or 'inet6' (use IPv6 only). (String), Default: any
- `node['stig']['sshd_config']['listen_address']` = Specifies the local addresses sshd(8) should listen on. (Array, String), Default: ['0.0.0.0']
- `node['stig']['sshd_config']['host_key']` = pecifies a file containing a private host	key used by SSH. (Array, String), Default: [
'/etc/ssh/ssh_host_key',
'/etc/ssh/ssh_host_rsa_key',
'/etc/ssh/ssh_host_dsa_key'
]

- `node['stig']['system_auth']['pass_reuse_limit']` = Limit password reuse - Represents the amount of passwords the user is forced to not reuse (Integer)

- `node['stig']['login_defs']['pass_max_days']` = Password expiration in days (Integer)
- `node['stig']['login_defs']['pass_min_days']` = Minimum wait time, in days, before changing password (Integer)
- `node['stig']['login_defs']['pass_warn_age']` = Number of days before password expires where system begins warning user (Integer)

- `node['stig']['login_banner']['motd']` = Login banner (String)
- `node['stig']['login_banner']['issue']` = Login banner (String)
- `node['stig']['login_banner']['issue_net']` = Login banner (String)

Configure postfix - See default attributes file for longer explanation
- `node["stig"]["mail_transfer_agent"]["inet_interfaces"]` = The address the the mail transfer agent should listen on (Array of String). NOTE: Deprecated. Use `default['stig']['postfix']['inet_interfaces']` instead
- `node["stig"]["postfix"]["inet_interfaces"]` = The inet_interfaces parameter specifies the network interface addresses that this mail system receives mail on. (Array of String). Default: ['localhost']
- `node["stig"]["postfix"]["soft_bounce"]` = Mail will remain queued that would otherwise bounce (String). Default: 'no'
- `node["stig"]["postfix"]["queue_directory"]` = Specifies the location of the Postfix queue (String). Default: '/var/spool/postfix'
- `node["stig"]["postfix"]["command_directory"]` =  The command_directory parameter specifies the location of all postXXX commands. (String). Default: '/usr/sbin'
- `node["stig"]["postfix"]["daemon_directory"]` =  The daemon_directory parameter specifies the location of all Postfix daemon programs. (String). Default: '/usr/libexec/postfix'
- `node["stig"]["postfix"]["data_directory"]` = The data_directory parameter specifies the location of Postfix-writable data files. (String). Default: '/var/lib/postfix'
- `node["stig"]["postfix"]["mail_owner"]` = The mail_owner parameter specifies the owner of the Postfix queue and of most Postfix daemon processes. (String). Default: 'postfix'
- `node["stig"]["postfix"]["default_privs"]` = The default_privs parameter specifies the default rights used by the local delivery agent for delivery to external file or command. (String). Default: 'nobody'
- `node["stig"]["postfix"]["myhostname"]` = The myhostname parameter specifies the internet hostname of this mail system. (Array of String). Default: []
- `node["stig"]["postfix"]["mydomain"]` = The mydomain parameter specifies the local internet domain name. (String). Default: ''
- `node["stig"]["postfix"]["myorigin"]` = The myorigin parameter specifies the domain that locally-posted mail appears to come from. (Array of String). Default: []
- `node["stig"]["postfix"]["inet_interfaces"]` = Enable IPv4, and IPv6 if supported. (String). Default: 'ipv4'
- `node["stig"]["postfix"]["proxy_interfaces"]` = The proxy_interfaces parameter specifies the network interface addresses that this mail system receives mail on by way of a proxy or network address translation unit. (Array of String). Default: []
- `node["stig"]["postfix"]["mydestination"]` = The mydestination parameter specifies the list of domains that this machine considers itself the final destination for. (String). Default: '$myhostname, localhost.$mydomain, localhost'
- `node["stig"]["postfix"]["local_recipient_maps"]` = The local_recipient_maps parameter specifies optional lookup tables with all names or addresses of users that are local with respect to $mydestination, $inet_interfaces or $proxy_interfaces (String). Default: ''
- `node["stig"]["postfix"]["unknown_local_recipient_reject_code"]` = The unknown_local_recipient_reject_code specifies the SMTP server response code when a recipient domain matches $mydestination or {proxy,inet}_interfaces, while $local_recipient_maps is non-empty and the recipient address or address local-part is not found. (String). Default: '550'
- `node["stig"]["postfix"]["mynetworks_style"]` = The mynetworks parameter specifies the list of "trusted" SMTP clients that have more privileges than "strangers". (String). Default: ''
- `node["stig"]["postfix"]["mynetworks"]` = Alternatively, you can specify the mynetworks list by hand, in which case Postfix ignores the mynetworks_style setting. (String). Default: ''
- `node["stig"]["postfix"]["relay_domains"]` = The relay_domains parameter restricts what destinations this system will relay mail to. (String). Default: ''
- `node["stig"]["postfix"]["relayhost"]` = The relayhost parameter specifies the default host to send mail to when no entry is matched in the optional transport(5) table. (String). Default: ''
- `node["stig"]["postfix"]["relay_recipient_maps"]` = The relay_recipient_maps parameter specifies optional lookup tables with all addresses in the domains that match $relay_domains. (String). Default: ''
- `node["stig"]["postfix"]["in_flow_delay"]` = The in_flow_delay configuration parameter implements mail input flow control (String). Default: ''
- `node["stig"]["postfix"]["alias_maps"]` = The alias_maps parameter specifies the list of alias databases used by the local delivery agent. The default list is system dependent. (String). Default: 'hash:/etc/aliases'
- `node["stig"]["postfix"]["alias_database"]` = The alias_database parameter specifies the alias database(s) that are built with "newaliases" or "sendmail -bi". (String). Default: 'hash:/etc/aliases'
- `node["stig"]["postfix"]["recipient_delimiter"]` = The recipient_delimiter parameter specifies the separator between user names and address extensions (user+foo). (String). Default: '+'
- `node["stig"]["postfix"]["home_mailbox"]` = The home_mailbox parameter specifies the optional pathname of a mailbox file relative to a user's home directory. (String). Default: ''
- `node["stig"]["postfix"]["mail_spool_directory"]` = The mail_spool_directory parameter specifies the directory where UNIX-style mailboxes are kept. (String). Default: ''
- `node["stig"]["postfix"]["mailbox_command"]` = The mailbox_command parameter specifies the optional external command to use instead of mailbox delivery. (String). Default: ''
- `node["stig"]["postfix"]["mailbox_transport"]` = The mailbox_transport specifies the optional transport in master.cf to use after processing aliases and .forward files. (String). Default: ''
- `node["stig"]["postfix"]["fallback_transport"]` = The fallback_transport specifies the optional transport in master.cf to use for recipients that are not found in the UNIX passwd database. (String). Default: ''
- `node["stig"]["postfix"]["luser_relay"]` = The luser_relay parameter specifies an optional destination address for unknown recipients. (String). Default: ''
- `node["stig"]["postfix"]["header_checks"]` = The header_checks parameter specifies an optional table with patterns that each logical message header is matched against, including headers that span multiple physical lines. (String). Default: ''
- `node["stig"]["postfix"]["fast_flush_domains"]` =  Postfix maintains per-destination logfiles with information about deferred mail, so that mail can be flushed quickly with the SMTP "ETRN domain.tld" command, or by executing "sendmail -qRdomain.tld". See the ETRN_README document for a detailed description. (String). Default: ''
- `node["stig"]["postfix"]["smtpd_banner"]` =  The smtpd_banner parameter specifies the text that follows the 220 code in the SMTP server's greeting banner. Some people like to see the mail version advertised. (String). Default: ''
- `node["stig"]["postfix"]["concurrency_limit"]` =  How many parallel deliveries to the same user or domain? With local delivery, it does not make sense to do massively parallel delivery to the same user, because mailbox updates must happen sequentially, and expensive pipelines in .forward files can cause disasters when too many are run at the same time. (Object (String, String)). Default: {} Example: { 'local' : '20', 'default' : '10' }
- `node["stig"]["postfix"]["debug_peer_list"]` =  The debug_peer_level parameter specifies the increment in verbose logging level when an SMTP client or server host name or address matches a pattern in the debug_peer_list parameter. (String). Default: '2'
- `node["stig"]["postfix"]["debug_peer_level"]` =  The debug_peer_list parameter specifies an optional list of domain or network patterns, /file/name patterns or type:name tables. (String). Default: ''
- `node["stig"]["postfix"]["debugger_command"]` =  The debugger_command specifies the external command that is executed when a Postfix daemon program is run with the -D option. (Array of String). Default: ['PATH=/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin','ddd $daemon_directory/$process_name $process_id & sleep 5']
- `node["stig"]["postfix"]["sendmail_path"]` =  The full pathname of the Postfix sendmail command. This is the Sendmail-compatible mail posting interface. (String). Default: '/usr/sbin/sendmail.postfix'
- `node["stig"]["postfix"]["newaliases_path"]` = The full pathname of the Postfix newaliases command. This is the Sendmail-compatible command to build alias databases. (String). Default: '/usr/bin/newaliases.postfix'
- `node["stig"]["postfix"]["mailq_path"]` = The full pathname of the Postfix mailq command.  This is the Sendmail-compatible mail queue listing command. (String). Default: '/usr/bin/mailq.postfix'
- `node["stig"]["postfix"]["setgid_group"]` = The group for mail submission and queue management commands.  This must be a group name with a numerical group ID that is not shared with other accounts, not even with the Postfix account. (String). Default: 'postdrop'
- `node["stig"]["postfix"]["html_directory"]` =  The location of the Postfix HTML documentation. (String). Default: 'no'
- `node["stig"]["postfix"]["manpage_directory"]` = The location of the Postfix on-line manual pages. (String). Default: '/usr/share/man'
- `node["stig"]["postfix"]["sample_directory"]` = The location of the Postfix sample configuration files. (String). Default: '/usr/share/doc/postfix-2.6.6/samples'
- `node["stig"]["postfix"]["readme_directory"]` = The location of the Postfix README files. (String). Default: '/usr/share/doc/postfix-2.6.6/README_FILES'

Usage
-----
Simply include the default recipe (stig::default) on an instance that needs to be hardened. May also want to include the auditd recipe (stig::auditd) to set a custom auditd configuration file

Authors
-------
- Author:: Ivan Suftin (<isuftin@usgs.gov>)
- Author:: David Blodgett (<dblodgett@usgs.gov>)

License
-------
Unless otherwise noted below, this software is in the public domain because it contains
materials that originally came from the United States Geological Survey, an agency of the
United States Department of Interior. For more information, see the official USGS
copyright policy at: http://www.usgs.gov/visual-id/credit_usgs.html#copyright

More information in [license file](https://github.com/USGS-CIDA/stig/blob/master/LICENSE)
