<?php

  $servname = 'localhost';
  $dbname = 'imanger';
  $user = 'root';
  $pass = 'root';

  print_r($_POST);
             
  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $ajoutAliments = $dbco->prepare("INSERT INTO aliments (Code, Nom, Type) VALUES('$_POST[id]','$_POST[nom]','$_POST[type]')");
    $ajoutAliments->execute();

  }

  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

            
?>