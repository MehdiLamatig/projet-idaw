<?php
function renderMenuToHTML($currentPageId) {
    $mymenu = array(
        'accueil' => 'Accueil',
        'aliments' => 'Aliments',
        'journal' => 'Journal',);

    echo "<nav class=\"menu\">";
    echo '<h1> iMangerMieux </h1>';
    foreach($mymenu as $pageId => $pageParameters) {
        echo "<li><a ";
        if ($currentPageId==$pageId)
            echo "class=\"selected\"";
        echo "href=index.php?page=$pageId.html>$pageParameters</a></li>";
    }
    echo "</nav>";
}
?>