<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="crear_actividades_final.css">
</head>
<body>
    <?php 
        include "../header.html";
    ?>
    <div class="contenedor">
        <div class="cantidad">
            <h3>Max Personas</h3>
            <input type="range" id="max-personas" min="1" max="50" value="25" oninput="this.nextElementSibling.value = this.value">
            <output>25</output>
        </div>
        <div class="cantidad">
            <h3>Max Personas</h3>
            <input type="range" id="max-personas" min="1" max="50" value="25" oninput="this.nextElementSibling.value = this.value">
            <output>25</output>
        </div>
        <div class="boton">
            <button>
                Crear actividad
            </button>
        </div>
    </div>
    <button class="flecha">
        <img src="../imagenes/flecha-correcta.png">
    </button>
</body>
</html>