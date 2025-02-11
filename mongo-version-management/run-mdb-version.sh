#!/bin/bash

while getopts "v:p:b:" opt; do
    case $opt in
        v)
            version="$OPTARG"
            ;;
        p)
            port="$OPTARG"
            ;;
        b)
            dbpath="$OPTARG"
            ;;
        *)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done

mkdir ~/bases-datos
mkdir ~/bases-datos/$dbpath
mkdir ~/bases-datos/$dbpath/data
mkdir ~/bases-datos/$dbpath/logs
nohup m use $version --port $port --dbpath ~/bases-datos/$dbpath/data > ~/bases-datos/$dbpath/logs/mongo.log 2>&1 &