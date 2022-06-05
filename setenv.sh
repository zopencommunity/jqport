#!/bin/sh
#
# Set up environment variables for general build tool to operate
# This setenv.sh is a sample. It describes the minimal environment
# variables required to set up a port environment.
# Alternate environment configurations of the name setenv_<variant>.sh
# are also available for reading.
# These examples are also used as a testbed for build.sh itself
#
if ! [ -f ./setenv.sh ]; then
	echo "Need to source from the setenv.sh directory" >&2
	return 0
fi

#
# The PORT_ROOT must be specified and should be set to "${PWD}"
# The PORT_ROOT _will_ become optional. It currently is required but
# will become optional once build.sh source's the environment directly
#
export PORT_ROOT="${PWD}"

#
# The PORT_TYPE is required. This indicates whether the Open-Source 
# package contents are stored in a 'git' format or a 'tarball' format.
# At some point, other formats (perhaps pax) may be supported
# For this example, we are specifying that we will use a zipped tarball format
# for our build.
#
export PORT_TYPE="TARBALL"

#
# Given the PORT_TYPE, build.sh will then need to know where to download from, 
# and what other software is required to be able to build this code. 
# Since a TARBALL was selected, the environment variables
# PORT_TARBALL_URL and PORT_TARBALL_DEPS are required to be specified.
# The PORT_TARBALL_URL is the fully-qualified location of the tar.gz format of 
# tarball, or the tar.xz format of tarball. 
# The PORT_TARBALL_DEPS lists each of the ported tools that are required to be
# able to build the code. In the simplest case, this will include:
#  - curl: required to be able to download the tarball
#  - gz or xz: required to be able to unzip the tarball
#  - git: required by build.sh to be able to apply patches
# Many packages will require basic tools like m4, make.      
#
export PORT_TARBALL_URL="https://github.com/ZOSOpenTools/zotsampleport/blob/main/tarballs/zotsample-1.0.tar.gz"
export PORT_TARBALL_DEPS="curl gzip"

#
# It can be convenient to include the environment variables for the 'other' format in 
# setenv.sh so that if you want to switch from tarball to git (and back), you just need 
# to change the PORT_TYPE variable.
# The GIT environment variables are analagous to the TARBALL environment variables.
# The minimal required list of dependencies will be:
#   - git: required to be able to clone the tarball and apply patche
#
export PORT_GIT_URL="git@github.com:ZOSOpenTools/zotsampleport.git"
export PORT_GIT_DEPS="git"
