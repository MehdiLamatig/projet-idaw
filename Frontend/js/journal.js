let currentMaxId = 1; 
let REPAS = [];
let currentEditedFoodId =-1;
let urlBackendPrefix = "http://localhost/IDAW/projet-idaw/Backend/";

$(document).ready(function(){
    $.getJSON(urlBackendPrefix+"afficheRepas.php", function(data){ 
        REPAS = data;
        $.each(REPAS, function(i, a){
            let repas = {};
            repas.date = a.date;
            repas.heure = a.heure; 
            repas.quantite=a.quantite;
            ajouteRepas(repas);
        });
    });
});


function AjaxEnvoieRepas(repas){
    $.ajax({
            method: "POST",
            url: urlBackendPrefix+"addRepas.php",
            dataType : "json",
            data : repas
        })
        
        .always(function(response){
            let data = JSON.stringify(response);
            console.log(response);
        });
}

function onForm(date,heure,quantite){
    $("#IDdate").val(date);
    $("#IDheure").val(heure);
    $("#IDquantite").val(quantite);
}


function onFormSubmit(){
    event.preventDefault();
    let newFood = {};
    newFood.date = $("#IDdate").val();
    newFood.heure = $("#IDheure").val();
    newFood.quantite = $("#IDquantite").val();
    if (newFood.nom != ''){
        if (currentEditedFoodId >= 0){
            currentFoodId = -1;
            onForm("","");
        }
        else{
            REPAS.push(newFood);
            ajouteRepas(newFood);
            AjaxEnvoieRepas(newFood);
            onForm("","");
        }
    }
}


function ajouteRepas(newFood){
    newFood.id = currentMaxId;
    $("#data_table").append
            (`<tr id=REPAS-${newFood.id}> 
            <td> ${newFood.date}  </td> <td> 
            ${newFood.heure}  </td> <td> 
            ${newFood.quantite}  </td></tr>`);
                
    currentMaxId++;
}
