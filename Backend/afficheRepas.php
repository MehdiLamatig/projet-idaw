<?php

  $servname = 'localhost';
  $dbname = 'imanger';
  $user = 'root';
  $pass = 'root';

  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $infosAliments = $dbco->prepare("SELECT repas.Date, repas.Heure, repas.ID, composer.Quantite, aliments.Nom  FROM `repas`
    JOIN composer ON repas.ID = composer.ID
    JOIN aliments ON composer.Code = aliments.Code");
    $infosAliments->execute();

    $resultatinfosAliments = $infosAliments->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultatinfosAliments);
  }
  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

?>