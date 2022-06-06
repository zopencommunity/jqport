#!/bin/sh
if ! [ ./zotsample ]; then
	echo "zot sample does not work" >&2
  exit 1
else
  echo "All tests passed" 
  exit 0
fi
