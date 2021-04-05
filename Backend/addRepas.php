<?php

  $servname = 'localhost';
  $dbname = 'imangermieux';
  $user = 'root';
  $pass = '';

  print_r($_POST);

  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $ajoutAliments = $dbco->prepare("INSERT INTO Repas (ID, Date, Heure) VALUES('$_POST[id]','$_POST[date]','$_POST[heure]')");
    $ajoutAliments->execute();
  }

  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }


?>