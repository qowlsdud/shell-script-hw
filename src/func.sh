for x in "$@"
do
    y=$(awk "BEGIN {print 0.5 * $x * $x}")

    echo "$y"
done