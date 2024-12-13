#!/bin/bash

# Function to display version information
function display_version() {
    echo "sysopctl - CLI tool wrapper for systemctl"
    echo "Version: v0.1.0"
}

# Function to list running services (like systemctl list-units --type=service)
function list_services() {
    systemctl list-units --type=service --state=running
}

# Function to show system load (like uptime command)
function show_system_load() {
    uptime
}

# Show help message
function show_help() {
    echo "Usage: sysopctl [OPTIONS] COMMAND [ARGS...]"
    echo ""
    echo "Options:"
    echo "  --help      Show this help message."
    echo "  --version   Show version information."
    echo ""
    echo "Commands:"
    echo "  service list  List all running services."
    echo "  system load   Show system load."
}

# Main logic to parse command-line arguments
if [[ $# -eq 0 ]]; then
    show_help
    exit 1
fi

case "$1" in
    --help)
        show_help
        ;;
    --version)
        display_version
        ;;
    service)
        if [[ "$2" == "list" ]]; then
            list_services
        else
            echo "Error: Invalid service command"
            show_help
        fi
        ;;
    system)
        if [[ "$2" == "load" ]]; then
            show_system_load
        else
            echo "Error: Invalid system command"
            show_help
        fi
        ;;
    *)
        echo "Error: Invalid option"
        show_help
        ;;
esac
