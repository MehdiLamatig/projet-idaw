<?php

  $servname = 'localhost';
  $dbname = 'imangermieux';
  $user = 'root';
  $pass = '';

  print_r($_POST);

  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $ajoutRepas = $dbco->prepare("INSERT INTO repas (ID, Date, Heure) VALUES('$_POST[id]','$_POST[date]','$_POST[heure]')");
    $ajoutRepas->execute();

    $ajoutComposer = $dbco->prepare("INSERT INTO composer (ID, Code, Quantite) VALUES('$_POST[id]',(SELECT Code FROM aliments WHERE nom='$_POST[aliment]'),'$_POST[quantite]')");
    $ajoutComposer->execute();
  }


  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }


?>