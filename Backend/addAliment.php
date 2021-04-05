<?php

  $servname = 'localhost';
  $dbname = 'imangermieux';
  $user = 'root';
  $pass = '';

  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $ajoutAliments = $dbco->prepare("INSERT INTO Aliments (Code, Nom, Type)
      VALUES('$_POST[id]','$_POST[nom]','$_POST[type]')");
    $ajoutAliments->execute();

    // $ratioAliments = $dbco->prepare("INSERT INTO associer (ID_apport, Nom, Ratio) VALUES
    //   (1,(SELECT Code FROM aliments WHERE nom='$_POST[nom]'),'$_POST[energie]'), 
    //   (2,(SELECT Code FROM aliments WHERE nom='$_POST[nom]'),'$_POST[glucides]'),
    //   (3,(SELECT Code FROM aliments WHERE nom='$_POST[nom]'),'$_POST[lipides]'), 
    //   (4,(SELECT Code FROM aliments WHERE nom='$_POST[nom]'),'$_POST[proteines]'); ");
    // $ratioAliments->execute();
  }

  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

?>