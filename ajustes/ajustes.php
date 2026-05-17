<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empleado del mes</title>
    <link rel="stylesheet" href="ajustes.css">
</head>
<body>
    
    <?php 
    include "../header.html";
    ?>
    <form action="procesar_ajustes.php" method="post" id="formulario" enctype="multipart/form-data">
            <div class="contenedor">
                <div class="foto_perfil">
                <label for="input-foto" style="cursor: pointer; display: inline-block;">
                    <img class="foto_user" id="foto" src="../imagenes/usuario.png" alt="error">
                    <img class="icono" src="../imagenes/camara.png">
                </label>
                <input type="file" id="input-foto" name="foto" accept="image/*" style="display: none;">
            </div>
            <div class="campo"><h3>Nombre:</h3><input id="nombre" name="nombre" type="text"></div>
            <div class="campo"><h3>Correo:</h3><input id="correo" name="correo" type="text"></div>
            <div class="campo"><button type="submit">Guardar</button></div> 
        </div>
    </form>
    <script>
    async function mostrar(){
        fetch("mostrar_ajustes.php")
        .then(response=>{
            if(!response.ok)throw new Error("Error en la respuesta del servidor");
            return response.json();
        })
        .then(data => {
            if(data.status=="ok"){
                document.getElementById("nombre").value=data.nombre
                document.getElementById("correo").value=data.correo
                document.getElementById("foto").src=data.foto
                } else if (data.code == 'NO_SESSION') {
                    alert('Ha ocurrido un error. Volviendo al inicio...');
                    window.location.href = '../index.php';
            }else{
                console.error("error",data.message)
            }
        }).catch(error => console.error('Error AJAX:', error));
           
    }
    document.addEventListener("DOMContentLoaded", mostrar);

    document.getElementById('input-foto').addEventListener('change', function(evento) {
        const archivo = evento.target.files[0];
        
        if (archivo) {
            const lector = new FileReader();//mostrar imagen antes de guardar
            lector.onload = function(e) {
                document.getElementById('foto').src = e.target.result;
            }
            lector.readAsDataURL(archivo);
        }
    });
    </script>
</body>
</html>