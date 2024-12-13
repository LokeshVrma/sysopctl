# sysopctl

sysopctl is a simple CLI tool that wraps around `systemctl` commands to help manage system services and display system load.

## Features

- View version information with `--version`
- List running services with `service list`
- Show system load with `system load`

## Usage

```bash
./sysopctl.sh --version
./sysopctl.sh service list
./sysopctl.sh system load
