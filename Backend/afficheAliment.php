<?php

  $servname = 'localhost';
  $dbname = 'imangermieux';
  $user = 'root';
  $pass = '';
              
  try{
    $dbco = new PDO("mysql:host=$servname;dbname=$dbname;charset=utf8", $user, $pass);
    $dbco->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // $infosAliments = $dbco->prepare("SELECT Nom.aliments, Type, En.Ratio AS Energie, Pro.Ratio AS Proteines, Glu.Ratio As Glucides, Lip.Ratio As Lipides FROM `Aliments`
    //   LEFT JOIN associer AS En ON aliments.Code = En.Nom AND En.ID_apport=1 
    //   LEFT JOIN associer AS Pro ON aliments.Code = Pro.Nom AND Pro.ID_apport=3
    //   LEFT JOIN associer AS Glu ON aliments.Code = Glu.Nom AND Glu.ID_apport=4
    //   LEFT JOIN associer AS Lip ON aliments.Code = Lip.Nom AND Lip.ID_apport=5");

    $infosAliments = $dbco->prepare("SELECT Nom, Type FROM `Aliments`");
    $infosAliments->execute();

    $resultatinfosAliments = $infosAliments->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($resultatinfosAliments);
  }
  catch(PDOException $e){
    echo "Erreur : " . $e->getMessage();
  }

?>