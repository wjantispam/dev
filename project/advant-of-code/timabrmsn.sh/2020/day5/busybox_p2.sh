sed 's/^/ibase=2;/; s/[BR]/1/g; s/[FL]/0/g' input | bc | sort -n | awk '{if ($0-i != 1) {seat=i+1}; i=$0} END {print seat}'