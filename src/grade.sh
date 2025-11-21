sum=0
n=$#
for score in "$@"
do
	if [ $score -ge 90 ]; then
		echo "등급: A"
	else
		echo "등급: B"
	fi

	sum=$((sum + score))
done

avg=$(awk "BEGIN {printf \"%.2f\", $sum / $n}")
avg_grade=$(awk "BEGIN {if ($avg>=90) print \"A\"; else print \"B\"}")

echo "평균 점수: $avg"
echo "평균 등급: $avg_grade"    
