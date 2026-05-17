<?php 
require_once "../sesiones.php";
    reconectar();
    if (isset($_SESSION['id'])) {
        desconexion();
        header("Location: ../formularios/formulario.php");
        exit(); 
    }else{
        header("Location: ../formularios/formulario.php");
            exit(); 
    }
    
    ?>