<?php

  $servname = 'localhost';
  $dbname = 'imangermieux';
  $user = 'root';
  $pass = '';

  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $infosAliments = $dbco->prepare("SELECT Date, Heure FROM `Repas`");
    $infosAliments->execute();

    $resultatinfosAliments = $infosAliments->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultatinfosAliments);
  }
  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

?>