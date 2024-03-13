#!/bin/sh

set -e

conan profile detect -vquiet --force 1> /dev/null
conan config install -vquiet /etc/conan/settings_user.yml

eval "$@"
