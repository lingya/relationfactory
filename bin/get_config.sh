#!/bin/bash
# This returns a property value from the config file.
# A default argument may be given for the case the property is not specified
# in the config file.
# Shell variables in the property value ARE NOT EXPANDED.
# Usage:
# get_config.sh <property_key> [<default_value>]

PROPKEY=$1
DEFAULT_VALUE="${@:2}"

if [ -z "$TAC_CONFIG" ]
then
  TAC_CONFIG=$TAC_ROOT/config/system.config
fi

conf=`cat $TAC_CONFIG \
| awk -v pk=$PROPKEY '$1 == pk { print $0 }' \
| cut -s -d' ' -f2-`

if [ -z "$conf" ]
then
  conf=$DEFAULT_VALUE
fi

echo $conf
