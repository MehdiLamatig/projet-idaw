let currentMaxId = 1; 
let aliments = [];
let currentEditedFoodId =-1;
let urlBackendPrefix = "http://localhost/projetSM/Backend/";

$(document).ready(function(){
    $.getJSON(urlBackendPrefix+"afficheAliment.php", function(data){ 
        aliments = data;
        $.each(aliments, function(i, a){
            let aliment = {};
            aliment.nom = a.Nom;
            aliment.type = a.Type;
            ajouteAliment(aliment);
        });
    });
});


function AjaxEnvoieAliment(aliment){
    $.ajax({
            method: "POST",
            url: urlBackendPrefix+"addAliment.php",
            dataType : "json",
            data : aliment
        })
        
        .always(function(response){
            let data = JSON.stringify(response);
            console.log(response);
        });
}

function onForm(nom,type){
    $("#IDnom").val(nom);
    $("#IDtype").val(type);
}




function onFormSubmit(){
    event.preventDefault();
    let newFood = {};
    newFood.nom = $("#IDnom").val();
    newFood.type = $("#IDtype").val();
    // $("p").remove("#contenu-removable");
    if (newFood.nom != ''){
        if (currentEditedFoodId >= 0){
            currentFoodId = -1;
            onForm("","");
        }
        else{
            aliments.push(newFood);
            ajouteAliment(newFood);
            AjaxEnvoieAliment(newFood);
            onForm("","");
        }
    }
}



function ajouteAliment(newFood){
    newFood.id = currentMaxId;
    $("#table-content").append
            (`<tr id=aliments-${newFood.id}> 
            <td> ${newFood.nom}  </td> <td> 
            ${newFood.type}  </td><td><button onclick="remove(${newFood.id})" style="color:red">Supprimer</button> </td> </tr>`);
                
    currentMaxId++;
}

function AjaxSupprimeAliment(id){
    $.ajax({
            url: urlBackendPrefix+"deleteAliment.php",
            method: "POST",
            dataType : "json",
            data : {'id': id}
        })
        .always(function(response){
            console.log(response);
        });
}

function remove(id){
    aliments.splice(id,1);
    $("#aliments-"+id).empty();
    AjaxSupprimeAliment(id);
}