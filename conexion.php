<?php 
$host = 'localhost';
$db   = 'matchtivity'; 
$user = 'root';   
$pass = '';       
$charset = 'utf8mb4';
$conexion = mysqli_connect($host, $user, $pass, $db);

// Para comprobar si funcionó:
if (!$conexion) {
    die("La conexión ha fallado: " . mysqli_connect_error());
}

?>