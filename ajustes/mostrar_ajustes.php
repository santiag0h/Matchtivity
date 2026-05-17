<?php
include "../sesiones.php";
    reconectar();

    if (!isset($_SESSION['id'])) {
        echo json_encode(['status' => 'error', 'code' => 'NO_SESSION']);
        exit(); 
    }
    $idUsuario = $_SESSION['id'];
    try{
        global $conexion;
        $sql = "SELECT nombre,correo, foto FROM usuario WHERE id_usuario = :id LIMIT 1";
        $consulta = $conexion->prepare($sql);
        $consulta->execute(['id' => $idUsuario]);
        $usuario = $consulta->fetch(PDO::FETCH_ASSOC);
        if($usuario){
            echo json_encode([
            'status' => 'ok',
            'nombre' => $usuario['nombre'],
            'correo' => $usuario['correo'],
            'foto'   => $usuario['foto']
        ]);
        }else {
            echo json_encode(['status' => 'error', 'message' => 'Usuario no encontrado']);
        }
        }catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => 'Error de base de datos']);
    }
    exit()
?>