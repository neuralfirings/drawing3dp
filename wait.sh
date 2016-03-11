#!/bin/bash

while true; do
  allpng=$(find . -type f -name "*.png" | wc -l)
  cd DONE
  donepng=$(find . -type f -name "*.png" | wc -l)
  cd ..
  cd www
  wwwpng=$(find . -type f -name "*.png" | wc -l)
  cd ..
  queuepng=`expr $allpng - $donepng - $wwwpng`
  queuemin=`expr 10 \\* $queuepng`
  echo $queuemin
  curl http://nyl.io/drawing/wait.php?min=$queuemin
  sleep 10
  kill $!
done