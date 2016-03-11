<?php  
  $min = $_GET['min'];
  $file = fopen("wait.json", "w") or die("can't open file");
  fwrite($file, '{"wait": ' . $min . '}');
  fclose($file);
  echo("set wait time: " . $min)
?>
