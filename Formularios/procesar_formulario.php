<?php
require_once "../conexion.php";
require_once "../sesiones.php";

if($_SERVER["REQUEST_METHOD"] === "POST"){
    $identificador = trim($_POST["usuario"] ?? "");
    $password_usuario = $_POST["contrasena"] ?? "";
    
    if(empty($identificador) || empty($password_usuario)){
        die("Por favor rellene todos los campos");
    }

    try{
        $consulta = "SELECT id_usuario, nombre, contrasena, ban_cuenta, tipo_cuenta 
             FROM usuario 
             WHERE nombre = :identificador1 OR correo = :identificador2 
             LIMIT 1";
             
$dato = $conexion->prepare($consulta);
$dato->bindParam(':identificador1', $identificador);
$dato->bindParam(':identificador2', $identificador);

$dato->execute();

$usuario_db = $dato->fetch(PDO::FETCH_ASSOC);
        
        if ($usuario_db) {
            // Control de Baneo
            if ((int)$usuario_db["ban_cuenta"] === 1) {
                die("Esta cuenta ha sido suspendida.");
            }

            $hash_db = $usuario_db["contrasena"];
            
            if (password_verify($password_usuario, $hash_db)) {
                
                login($usuario_db['id_usuario'], $usuario_db['nombre']);
                cookies($usuario_db['id_usuario']);
                
                $_SESSION["tipo_cuenta"] = $usuario_db["tipo_cuenta"];

                if ($usuario_db["tipo_cuenta"] === "admin") {//ver si eres admin
                    header("Location: ../admin/dashboard.php");//cambiar mas tarde por que quiero que sea 1 o 0
                } else {
                    header("Location: ../ver_actividades/mostrar_actividades.php");
                }
                exit();
                
            } else {
                echo "Contraseña inválida.";
            }
        } else {
            echo "El usuario o correo no existe.";
        }
    } catch(PDOException $e) {
        echo "Hubo un error al procesar el inicio de sesión.".$e;
    }
}
?>