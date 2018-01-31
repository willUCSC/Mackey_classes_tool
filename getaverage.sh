#! /usr/bin/bash
score_folder="/afs/cats.ucsc.edu/class/cmps112-wm.f17/.graded/hist/";
assignment1="histogram.a1";
assignment=$score_folder$assignment1;
echo "1. NO warranty for this little script";
number_calculated=0;
total_score=0;
#I don't understand this part, something to do with file descriptor
exec 10< $assignment;
while read readin <&10; do
	if [[ $readin =~ (^[0-9]+)(([[:space:]]=)*)[[:space:]]([0-9]*) ]]; then
	 score=${BASH_REMATCH[1]};
     people=$((${BASH_REMATCH[4]}-$number_calculated));
     number_calculated=${BASH_REMATCH[4]}
     total_score=$(($score * $people + $total_score))
	fi
done
echo "2. The average of the following histogram: "$assignment" is: "$((total_score/$number_calculated))
