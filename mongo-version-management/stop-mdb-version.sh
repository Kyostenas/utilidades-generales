#!/bin/bash

while getopts "v:" opt; do
    case $opt in
        v)
            version="$OPTARG"
            ;;
        *)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done


pid_eliminar=$(ps aux | grep [m]ongod | grep $version | awk '{print $2}')

sudo kill $pid_eliminar

# pkill -f "m use $version"