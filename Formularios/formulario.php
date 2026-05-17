<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscripción</title>
    <link rel="stylesheet" href="formulario.css">
</head>
<body class='fondo'>
    <?php 
    require_once "../sesiones.php";
      reconectar();
    if (isset($_SESSION['id'])) {
            header("Location: ../ver_actividades/mostrar_actividades.php");
            exit(); 
    }?>
    <div class="alineacion">
        <div class="formulario">
            <form action="procesar_formulario.php" method="post" id="formulario">
                <div class="text1">
                Usuario/Email:<br><input class="campo" type="text" name="usuario"  placeholder="Introduzca su usuario/Email"><br>
                </div>
                <div class="text2">
                Contraseña:<br><input  class="campo" type="password" name="contrasena" placeholder="Introduzca su contraseña"><br>
                </div>
                <div class="enviar">
                <button  type="submit" name="enviar">enviar </button><br>
                </div>
            </form>
            <div class="enlaces">
                <a href="correo olvidado.html">He olvidado mi contraseña</a><br>                
                    <a  href="crear cuenta.php">No tengo cuenta</a>
            </div>
        </div>
        
        </div>
</body>
</html>