<?php
$cantidad = $_GET['cantidad'] ?? 9;
    $i=0;
    echo "<div class='todo'>";
    while($i<$cantidad){
        $x=0;
        echo "<div class='lineas'>";
            while($x<3){
                echo "<div class='actividad'>";
                    echo "<img src='../imagenes/futbol.jpg' alt='error'>";
                    echo "<div class='texto'>";
                        echo "<div>";
                            echo "Futbol";
                        echo "</div>";
                        echo "<div class='abajo_actividad'>";
                            echo "<div>";
                                echo "7 usuarios";
                            echo "</div>";
                            echo "<div>";
                                echo "20 Km";
                            echo "</div>";
                        echo "</div>";
                    echo "</div>";
                echo "</div>";
                $x++;
                $i++;
            }
        echo "</div>";
    }
     echo "</div>";
?>