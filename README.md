# Drawing 3DP Demo

## Instructions for running

1. start `./wait.sh` in Terminal. This will update the time keeper with how many files are waiting for print. 
2. load `http://www.nyl.io/drawing` on Surface
3. save drawings into batch folders (~6/batch)
4. when folder is full, print and update time
- Run `./pop.sh FOLDER` in Terminal 
- Load `done > FOLDER > exports` files into CURA
- generate GCode
- print
- update print time by hitting up `http://www.nyl.io/drawing/print.php?min=XXX`

