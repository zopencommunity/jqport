#!/bin/sh
set -x
prod=$(cat installdir)
if ! [ -d "${prod}" ]; then
	echo "Installation dir ${prod} from configure does not exist"
	if ! mkdir -p "${prod}" ; then
		echo "Installation dir ${prod} from configure does not exist and can not be created" >&2
	else
		echo "Directory created"
	fi
	exit 1
fi
if ! cp zotsample "${prod}" ; then
	echo "Unable to install zotsample into ${prod}" >&2
	exit 1
fi
exit 0
