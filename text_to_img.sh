#!/bin/sh

L="UNIXxinu";
o=convert;
k=50;
i=0;
a=($($o -list font|awk '/nt:/{print $2}'|shuf| rg -v 'Noto|Math|Symbol'));
x="eval w";
s="";
w(){ s=$s" -font ${a[$i]} -draw 'text $[k+150*$i],0 ${L:$i:1}'";i=$[++i]; };

for (( j=0; j<${#L}; j++)); do
  $x
done
echo "$o -size $[150*${#L}]x400 xc: -gravity west -pointsize 80 $s result.png" | sh;

# for f in {1..100}do;
#   echo "$o -size 600x400 xc: -gravity west -pointsize 80 $s -negate $f.png";done
# done
