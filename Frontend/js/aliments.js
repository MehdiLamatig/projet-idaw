let currentMaxId = 1; 
let aliments = [];
let currentEditedFoodId =-1;
let urlBackendPrefix = "http://localhost/IDAW/projet%20S&M/Backend/";

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
            ${newFood.type}  </td> <td><button onclick="edit(${newFood.id})" style="color:blue">Modifier</button>  <button onclick="remove(${newFood.id})" style="color:blue">Supprimer</button> </td> </tr>`);
                
    currentMaxId++;
}

function AjaxChangeAliment(aliment){
    $.ajax({

            url: urlBackendPrefix+"editAliment.php",
            method: "POST",
            dataType : "json",
            data : aliment
        })
        .always(function(response){
            console.log(response);
        });
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


function edit(id){
    currentEditedFoodId = id;
    onForm(aliments[currentEditedFoodId].Nom,
            aliments[currentEditedFoodId].Type
        );

}

function remove(id){
    aliments.splice(id,1);
    $("#aliments-"+id).empty();
    AjaxSupprimeAliment(id);
}


function editAliment(newFood){
    newFood.id = currentEditedFoodId;
    aliments[newFood.id] = newFood;
    $("#aliments-"+newFood.id).empty();
    $("#aliments-"+newFood.id).append(`<td> 
            ${newFood.nom}  </td> <td> 
            ${newFood.type}  </td> <td>
            <button onclick="edit(${newFood.id})" style="color:blue">Edit</button>  <button onclick="remove(${newFood.id})" style="color:blue">Remove</button> </td>`);
}