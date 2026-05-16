<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="crear_actividades.css">
<?php 
//hacer una session que vaya recogiendo los datos de las tres pantallas asi no hace falta rallarse mucho
include "../header.html";
?>

</head>
<body>
    <div class="contenedor">
        <div class="foto_perfil">
            <label for="input-foto" style="cursor: pointer; display: inline-block;">
                <img class="user" id="foto" src="../imagenes/usuario.png" alt="error">
                <img class="icono" src="../imagenes/camara.png">
            </label>
            <input type="file" id="input-foto" name="foto_perfil" accept="image/*" style="display: none;">
        </div>
        <div class="campo"><h3>Nombre:</h3><input id="nombre" type="text"></div>
        <div class="campo"><h3>Hora:</h3><input id="nombre" type="text"></div>
        <div class="campo_etiqueta"><h3>Etiqueta:</h3><input id="nombre" type="text"><img class="foto_etiqueta" src="../imagenes/agregar.png"></div>
        <div class="campo"><h3>Zona:</h3><input id="nombre" type="text"></div>
        <div class="campo"><h3>Descripcion:</h3><textarea id="descripcion"></textarea></div>
        <div class="campo_boton"><button><img src="../imagenes/flecha-correcta.png"></button></div> 
    </div>
</body>
</html>