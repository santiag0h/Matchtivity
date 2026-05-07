<link rel="stylesheet" href="mostrar_actividades.css">
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
function cargarMas() {
    cantidad += 3; // sumas más actividades
    cargarActividades(cantidad);
}
</script>
<button onclick="cargarMas(3)">cargar cargarActividades</button>