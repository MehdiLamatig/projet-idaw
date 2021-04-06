<?php

  $servname = 'localhost';
  $dbname = 'imanger';
  $user = 'root';
  $pass = 'root';
  
              
  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $infosAliments = $dbco->prepare("SELECT Nom, Type FROM `aliments`");
    
    $infosAliments->execute();

    $resultatinfosAliments = $infosAliments->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultatinfosAliments);
  }
  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

            
?>