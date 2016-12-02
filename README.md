ansible-papertrail
==================

Installs and configures `remote_syslog` for export to PaperTrail.

### Configuration

##### Package

The default settings will install `remote_syslog` version 0.19.

```yaml
remote_syslog_package_url: https://github.com/papertrail/remote_syslog2/releases/download/v0.19/remote-syslog2_0.19_amd64.deb
remote_syslog_package_shasum: fd98bb5daf599c6f167edcb65a1861b007a16a61691dfc4796bfe2dddae8813f
```

To override, you'll first need to create a checksum for the package.

```
$ wget https://github.com/papertrail/remote_syslog2/releases/download/v0.19-beta3/remote-syslog2_0.19-beta3_amd64.deb
$ sha256sum remote-syslog2_0.19-beta3_amd64.deb
```

Then set your new values.

```yaml
remote_syslog_package_url: https://github.com/papertrail/remote_syslog2/releases/download/v0.19-beta3/remote-syslog2_0.19-beta3_amd64.deb
remote_syslog_package_shasum: d05bb14a12d2ffe83edffc2b18ad73478a9fd0ec09e9a53b392a17b1c4196570
```

##### Papertrail

Set your PaperTrail host, port and protocol.

```yaml
papertrail_host: "?.papertrailapp.com"
papertrail_port: 0000
papertrail_protocol: "tls"
```

##### Files

There are a number of default exports defined in `remote_syslog_files`.

```yaml
remote_syslog_files:
  - /var/log/syslog
  - /var/log/auth.log
  - /var/log/dmesg
  - /var/log/apt/history.log
  - /var/log/fsck/checkfs
  - /var/log/fsck/checkroot
  - /var/log/unattended-upgrades/unattended-upgrades.log
```

Additional files can be added to `remote_syslog_additional_files`, which by default is empty.

```yaml
remote_syslog_additional_files:
  - /var/log/apache2/*.log
```

### Adding it to your Playbook

Add these lines to your role file:

```yaml
- src: git@github.com:aptoma/ansible-papertrail
  scm: git
  version: 0.1.0
  name: aptoma.papertrail
```

Run `ansible-galaxy install -r {your role file}` then add it to your roles list:

```yaml
  roles:
    - role: aptoma.papertrail
      papertrail_host: ""
      # Etc
```