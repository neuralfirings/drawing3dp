<?php  
  $min = $_GET['min'];
  $currtime = time();
  $donetime = $currtime + $min * 60;
  $file = fopen("print.json", "w") or die("can't open file");
  fwrite($file, '{"print": ' . $donetime . '}');
  fclose($file);
  echo("set print time to finish at: " . $donetime)
?>
