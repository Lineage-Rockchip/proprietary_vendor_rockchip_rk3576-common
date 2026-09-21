#! /vendor/bin/sh

system_mtime=$(stat -c %Y /system);
date @$system_mtime

