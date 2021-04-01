<?php

  $servname = 'localhost';
  $dbname = 'imangermieux';
  $user = 'root';
  $pass = '';

              
  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $suppAliments = $dbco->prepare("DELETE FROM Aliments WHERE (Code='$_POST[id]')");
    $suppAliments->execute();
  }
  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

            
?>