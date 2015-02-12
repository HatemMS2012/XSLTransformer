<?php

$directory = 'uploads/';

$it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($directory));

while($it->valid()) {

    if (!$it->isDot()) {

        echo 'SubPathName: ' . $it->getSubPathName() . "\n";
        echo "<p>";
        echo 'Key:         ' . $it->key() . "\n\n";
        echo "<p>";
    }

    $it->next();
}

?>