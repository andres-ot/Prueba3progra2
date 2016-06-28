/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('select').select2();

$.get("/weajquery/Tarea?modulo=servicios", function(data){
}).done(function(data){
    $.each(data, function( i, objeto ){
        $("#servicios").append("<option value='"+objeto.servicio_id+"'>"+objeto.nombre+"</option>");
    });
}).fail(function(data){
    console.log(data);
});

$("#servicios").change( function(){
    // limpiar options del select
    $('#responsables').prop('disabled', true);
    $("#unidades > option").remove();
    
    // cargar elementos
    var id_servicio = $(this).val();
    var url = "/weajquery/Tarea?modulo=unidades&servicio_id="+id_servicio;
    console.log(url);
    $.get(url, function(data){
        
    }).done(function(data){
        
        $.each(data, function(i,objeto){
            $("#unidades").append("<option value='"+objeto.servicio_id+"'>"+objeto.nombre+"</option>");
        });

    }).fail(function(data){
        
    });
    // 1 activar
    $("#unidades").prop('disabled', false);

});

$('#unidades').change(function(){
   
   $('#responsables > option').remove();
   var id_unidad = $(this).val();
   var url = "/weajquery/Tarea?modulo=responsables&unidad_id="+id_unidad;
   $.get(url, function(data){
       
   }).done(function(data){
       $.each(data, function(i,objeto){
            $("#responsables").append("<option value='"+objeto.responsable_id+"'>"+objeto.nombre+"</option>");
       });
   }).fail(function(data){
      
   });
   
   $('#responsables').prop('disabled', false);
});

$("#fecha").datepicker({
    format: 'yyyy-mm-dd'
});
