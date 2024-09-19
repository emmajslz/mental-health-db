#!/bin/sh

for file in *;
   do
   for i in {4..18};
      do
      attribute=`head -n 1 $file | cut -d ',' -f$i`
      value=`head -n 2 $file | tail -n 1 | cut -d ',' -f$i`
      echo "$file,$attribute,$value"
   done
done
