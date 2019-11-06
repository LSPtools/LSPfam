#!/bin/bash

# Usage:  

INPUT=$1
DATABASE=$2
SECPFAM=$3

if [ ! -f ${INPUT}.hits ]; then
   pfam_scan.pl  -clan_overlap   -as  -fasta $INPUT -dir $DATABASE > ${INPUT}.hits
fi

cat ${INPUT}.hits | grep -f <(cat $SECPFAM)|tee ${INPUT}.sec_hits |awk '{print $1}'| uniq -c| awk '{print $2, "TRUE", $1}' > ${INPUT}.pfammer_sec
