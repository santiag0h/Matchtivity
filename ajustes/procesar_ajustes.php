<?php
require_once "../sesiones.php";
reconectar();

if($_SERVER["REQUEST_METHOD"] == "POST"){
    $nombre = $_POST["nombre"] ?? "";
    $correo = $_POST["correo"] ?? "";
    
    if(empty($nombre) || empty($correo)){
        die("Por favor no deje ningun campo vacio");
    }
    
    if(!filter_var($correo, FILTER_VALIDATE_EMAIL)){
        die("Error: El formato del correo electrónico no es válido");
    }
    
    $nombreFotoBD = null; 

    if(isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
        $fotoTmp   = $_FILES['foto']['tmp_name'];
        $fotoName  = $_FILES['foto']['name'];
        $fotoSize  = $_FILES['foto']['size'];
        
        $extension = strtolower(pathinfo($fotoName, PATHINFO_EXTENSION));
        $extensionesPermitidas = ['jpg', 'jpeg', 'png', 'webp'];
        
        if(!in_array($extension, $extensionesPermitidas)){
            die("Error: Solo se permiten imágenes (JPG, PNG, WEBP).");
        }
        
        if($fotoSize > 2 * 1024 * 1024){
            die("Error: La imagen supera el tamaño máximo de 2MB.");
        }
        
        $nombreFotoBD = $_SESSION['id'] . "_" . time() . "." . $extension;
        
        $rutaDestino = "../fotos_usuarios/" . $nombreFotoBD;
        try {
            $sqlBusqueda = "SELECT foto FROM usuario WHERE id_usuario = :id";
            $stmtBusqueda = $conexion->prepare($sqlBusqueda);
            $stmtBusqueda->execute(['id' => $_SESSION['id']]);

            $usuarioActual = $stmtBusqueda->fetch();
            if ($usuarioActual && !empty($usuarioActual['foto'])) {
                $fotoViejaRuta = "../fotos_usuarios/" . $usuarioActual['foto'];
                if ($fotoViejaRuta !== "../imagenes/usuario.png") {
                    if (file_exists($fotoViejaRuta)) {
                        unlink($fotoViejaRuta); 
                    }
                }
            }
        } catch (PDOException $e) {
            die("Error al gestionar la foto anterior: " . $e->getMessage());
        }
        if(!move_uploaded_file($fotoTmp, $rutaDestino)){
            die("Error al guardar la imagen en el servidor. Revisa que la carpeta 'fotos_usuarios' exista en la raíz.");
        }
    }
    

    try{
        if($nombreFotoBD !== null) {
            $check = $conexion->prepare("SELECT id_usuario FROM usuario WHERE (nombre = :usuario OR correo = :correo) AND id_usuario != :id LIMIT 1");
            $check->execute([
                'usuario' => $nombre,
                'correo' => $correo,
                'id'=> $_SESSION['id']
            ]);
            
            if($check->fetch()){
                die("Error: El nombre de usuario o el correo ya están registrados");
            }
            $consulta = "UPDATE usuario SET nombre = :nombre, correo = :correo, foto = :foto WHERE id_usuario = :id";
            $parametros = [
                'nombre' => $nombre,
                'correo' => $correo,
                'foto'   => $rutaDestino,
                'id'     => $_SESSION['id']
            ];
        } else {
            $check = $conexion->prepare("SELECT id_usuario FROM usuario WHERE (nombre = :usuario OR correo = :correo) AND id_usuario != :id LIMIT 1");
            $check->execute([
                'usuario' => $nombre,
                'correo' => $correo,
                'id'=> $_SESSION['id']
            ]);
            
            if($check->fetch()){
                die("Error: El nombre de usuario o el correo ya están registrados");
            }
            $consulta = "UPDATE usuario SET nombre = :nombre, correo = :correo WHERE id_usuario = :id";
            $parametros = [
                'nombre' => $nombre,
                'correo' => $correo,
                'id'     => $_SESSION['id']
            ];
        }

        $stmt = $conexion->prepare($consulta);
        $stmt->execute($parametros);
        
        $_SESSION['username'] = $nombre;
        header("Location: ajustes.php");
        exit();
      
        
    } catch(PDOException $e){
        echo "Hubo un error al guardar: ";
    }
}
?>