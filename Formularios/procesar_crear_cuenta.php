<?php 
require_once "../conexion.php";
require_once "../sesiones.php";

if($_SERVER["REQUEST_METHOD"] === "POST"){
    $usuario = trim($_POST['usuario'] ?? "");
    $correo = trim($_POST['correo'] ?? "");
    $contrasena = $_POST["contrasena"] ?? "";
    $confirmar_contrasena = $_POST["confirmar"] ?? ""; 


    if(empty($usuario) || empty($correo) || empty($contrasena) || empty($confirmar_contrasena)){
        die("Por favor rellene todos los campos");
    }
    
    if($contrasena !== $confirmar_contrasena){
        die("Error: Las contraseñas no coinciden");
    }
    

    if(!filter_var($correo, FILTER_VALIDATE_EMAIL)){
        die("Error: El formato del correo electrónico no es válido");
    }
    
    try{

        $check = $conexion->prepare("SELECT id_usuario FROM usuario WHERE nombre = :usuario OR correo = :correo LIMIT 1");
        $check->execute([
            'usuario' => $usuario,
            'correo' => $correo
        ]);
        
        if($check->fetch()){
            die("Error: El nombre de usuario o el correo ya están registrados");
        }
        
        $hash = password_hash($contrasena, PASSWORD_DEFAULT);
        

        $sql = "INSERT INTO usuario (nombre, correo, contrasena)
                VALUES (:usuario, :correo, :contrasena)";
                
        $insertarUsuarios = $conexion->prepare($sql);
        
        $insertarUsuarios->execute([
            'usuario' => $usuario,
            'correo' => $correo,
            'contrasena' => $hash
        ]);
        
        $nuevo_id = $conexion->lastInsertId();
        
        login($nuevo_id, $usuario);
        cookies($nuevo_id);
        
        header("Location: ../ver_actividades/mostrar_actividades.php");
        exit;
        
    }catch(PDOException $e){
        echo "Hubo un error al guardar";
    }
}
?>