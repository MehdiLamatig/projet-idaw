<?php
    require_once("Frontend/template_header.php");
    $currentPageId = 'accueil.html';
    if(isset($_GET['page']))
        $currentPageId = $_GET['page'];
?>

    <?php
        require_once('Frontend/template_menu.php');
        renderMenuToHTML($currentPageId);
    ?>
    
    <div class="content">
        <?php
            $pageToInclude = "Frontend/pages/".$currentPageId;
            if(is_readable($pageToInclude))
                require_once($pageToInclude);
            else
                require_once("Frontend/error.php");
        ?>
    </div>

<?php
  require_once("Frontend/template_footer.php");
?>