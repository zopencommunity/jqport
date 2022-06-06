#
# check.sh: this script runs build.sh in a variety of ways to
# validate that build.sh works
#
# There is no framework used here, because it is testing the framework
# so just use 'sh'
#
# This check should be run before checking in updates to build.sh

#set -x

# Test #1 - validate that basic build works
rm -rf zotsample-1.0 ${HOME}/zot/prod/zotsample-1.0

if ! build.sh ; then 
	echo "Basic build of sample failed" >&2
	exit 4
fi

# Test #2 - validate that basic build works (verbose)
rm -rf zotsample-1.0 ${HOME}/zot/prod/zotsample-1.0

if ! build.sh -v ; then 
	echo "Basic build of sample failed" >&2
	exit 4
fi

# Test #3 - provide an alternate location to install into
rm -rf zotsample-1.0 ${HOME}/zot/prod/zotsample-1.0

if ( export PORT_INSTALL_DIR="/tmp/zotsample" && ! build.sh ) ; then
	echo "Build and install into /tmp/zotsample failed" >&2
fi

if ( cd /tmp/zotsample && . ./.env && ! zotsample ) ; then
	echo "Unable to run zotsample from /tmp" >&2
else
	rm -rf /tmp/zotsample
fi
