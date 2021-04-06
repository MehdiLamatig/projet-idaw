<?php
function renderMenuToHTML($currentPageId) {
    $mymenu = array(
        'accueil' => 'Accueil',
        'aliments' => 'Aliments',
        'journal' => 'Journal',);

    echo "<nav  style='background-color: #00BFFF;'>";
    echo '<a > iMangerMieux </a>';
    echo '<div  >';
    echo '<ul >';
    foreach($mymenu as $pageId => $pageParameters) {
        echo "<li><a ";
       if ($currentPageId==$pageId)
            echo "class=\"selected\"";
        echo "href=index.php?page=$pageId.html>$pageParameters</a></li>";
    }
    echo "</u1></nav>";
}







