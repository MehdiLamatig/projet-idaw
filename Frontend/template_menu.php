<?php
function renderMenuToHTML($currentPageId) {
    $mymenu = array(
        'accueil' => 'Accueil',
        'aliments' => 'Aliments',
        'journal' => 'Journal',);

    echo "<nav class='navbar navbar-expand-lg navbar-light' style='background-color: #00BFFF;'>";
    echo '<a class="navbar-brand"> iMangerMieux </a>';
    echo '<div class="collapse navbar-collapse" id="navbarSupportedContent">';
    echo '<ul class="navbar-nav mr-auto">';
    foreach($mymenu as $pageId => $pageParameters) {
        echo "<li><a ";
        if ($currentPageId==$pageId)
            echo "class=\"selected\"";
        echo "href=index.php?page=$pageId.html>$pageParameters</a></li>";
    }
    echo "</u1></nav>";
}
?>