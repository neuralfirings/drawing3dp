#!/bin/bash

echo "================BEGIN BATCH "$1"================"

currbatch="batch"$1
nextbatch_id=`expr $1 + 1`
cd Waiting
cd $currbatch
mkdir exports

for f in *.png
do
  echo "---------------------------------------------"
  fname="${f##*/%.*}"
  fname="${fname%.*}"
  echo "Popping: " $fname
  dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  # echo $dir
  mkdir $fname
  cp $fname.png $fname/$fname.png
  cd $fname
  convert $fname.png $fname.bmp
  potrace -s $fname.bmp
  /Applications/3D/Blender2.76b/blender.app/Contents/MacOS/blender -b -P /Users/nyl/Dropbox/MakerProjects/drawing/svg2stl.py -- $fname $dir 75 1.89 mac
  cd ..
  mv $fname/$fname.stl exports/$fname.stl
done

cd ..
mkdir "batch"$nextbatch_id
cd ..
mv waiting/$currbatch done/$currbatch

echo "===============END BATCH "$1"================="

#mkdir $1
#cp $1.png $1/$1.png
#cd $1
#convert $1.png $1.bmp
#potrace -s $1.bmp
#/Applications/3D/Blender2.76b/blender.app/Contents/MacOS/blender -b -P /Users/nyl/git_projects/simplepopper/svg2stl.py -- nyl 75 3
