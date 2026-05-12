<?php
require_once "../conexion.php";
$cantidad = $_GET['cantidad'] ?? 9;
try{
    $sql = "SELECT nombre,imagen,lugar FROM actividad ORDER BY id_actividad DESC LIMIT ". $cantidad ;
    $consulta=$conexion->prepare($sql);
    $consulta->execute();
    $actividades = $consulta->fetchAll(PDO::FETCH_ASSOC);
}catch (PDOException $e) {
    die("Error al obtener la actividades: " . $e->getMessage());
}

    
    echo "<div class='todo'>";
    $i=0;
    foreach($actividades as $act){
        $x=0;
            if ($i % 3 == 0) {
                echo "<div class='lineas'>";
            }
                echo "<div class='actividad'>";
                    echo "<img src='".htmlspecialchars($act['imagen'])."' alt='error'>";
                    echo "<div class='texto'>";
                        echo "<div>";
                            echo htmlspecialchars($act['nombre']);
                        echo "</div>";
                        echo "<div class='abajo_actividad'>";
                            echo "<div>";
                                echo "7 usuarios";
                            echo "</div>";
                            echo "<div>";
                                echo htmlspecialchars($act['lugar']);
                            echo "</div>";
                        echo "</div>";
                    echo "</div>";
                echo "</div>";
            
            $i++;
            if ($i % 3 == 0 || $i == count($actividades)) {
                echo "</div>"; // Cierra .lineas
            }
            
    }
     echo "</div>";
?>