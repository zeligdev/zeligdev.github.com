#!/bin/sh

SCRIPT="writeLines(paste(version\$major, version\$minor, sep='.'))"
VERSION=`echo $SCRIPT | /usr/bin/R --vanilla --slave | sed -e "s/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)/\1.\2/g"`

SRCPATH="src/contrib"

# move tar.gz
mv *.tar.gz $SRCPATH


# Define PACKAGES and PACKAGES.gz scripts
SRCSCRIPT="setwd('$SRCPATH'); tools:::write_PACKAGES()"

# Execute Script
echo $SRCSCRIPT | /usr/bin/R --vanilla --slave
