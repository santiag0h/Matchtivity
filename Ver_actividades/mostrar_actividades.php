<?php
    include "../header.html";
?>
<link rel="stylesheet" href="mostrar_actividades.css">
<div class="cont"><button class="annadir"><img src="../imagenes/annadir.png"></img></button></div>
<div id="contenedor"></div>
<script>

var cantidad=9
function cargarActividades(cantidad) {
    fetch(`hacer_actividades.php?cantidad=${cantidad}`)
        .then(res => res.text())
        .then(html => {
            document.getElementById("contenedor").innerHTML = html;
        });
}
cargarActividades(cantidad);

var cargando = false;
window.onscroll = function() {
    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 100) {
        if (!cargando) {
            cantidad += 3;
            cargarActividades(cantidad);
        }
    }
};
</script>
