#!/bin/bash

echo "================BEGIN "$1"================"

cd $1
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
  /Applications/3D/Blender2.76b/blender.app/Contents/MacOS/blender -b -P /Users/nyl/Dropbox/MakerProjects/drawing/svg2stl.py -- $fname $dir 75 1.89
  cd ..
  mv $fname/$fname.stl exports/$fname.stl
done

cd ..
mv $1 done/$1

echo "===============END "$1"================="

#mkdir $1
#cp $1.png $1/$1.png
#cd $1
#convert $1.png $1.bmp
#potrace -s $1.bmp
#/Applications/3D/Blender2.76b/blender.app/Contents/MacOS/blender -b -P /Users/nyl/git_projects/simplepopper/svg2stl.py -- nyl 75 3