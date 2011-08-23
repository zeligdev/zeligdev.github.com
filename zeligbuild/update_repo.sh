#!/bin/sh


# * Pull changes from 



SCRIPT="writeLines(paste(version\$major, version\$minor, sep='.'))"
VERSION=`echo $SCRIPT | /usr/bin/R --vanilla --slave | sed -e "s/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)/\1.\2/g"`

SRCPATH="src/contrib"

# move tar.gz
#mv *.tar.gz $SRCPATH


# Define PACKAGES and PACKAGES.gz scripts
SRCSCRIPT="setwd('$SRCPATH'); tools:::write_PACKAGES()"

# Execute R Script
#echo $SRCSCRIPT | /usr/bin/R --vanilla --slave







FILENAME="REPOSITORIES"
DEST="dest"
#
#
while read LINE
do

  # git-pull
  git clone $LINE TMP

  # Build with R
  R CMD build TMP

  # clean-up
  rm -fr TMP

done < $FILENAME

#
#
rm -fr $DEST
mkdir $DEST

#
#
for FILE in *.tar.gz
do
  mv -f $FILE $DEST
done

# setwd as $DEST
#
