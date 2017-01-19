<?php
$img = array();
$handler = opendir('img/');

while ($file = readdir($handler)) {
  if ($file != "." && $file != "..") {
    $img[] = $file;
  }
}

closedir($handler);

?>
<!DOCTYPE html>
<html>
<head>
   <title>Creative Commons Cat Pictures</title>
   <meta http-equiv="refresh" content="3;/"></meta>
   <link rel="stylesheet" href="/style.css">
</head>
<body>
   <a href="/"><img class="kittens" src="/img/<?=$img[array_rand($img)];?>" height="100%"></a>
</body>
</html>
