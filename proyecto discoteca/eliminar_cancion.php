<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    exit("<p class='error'>Error: No tienes permiso para realizar esta acción.</p>");
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['cod_cancion'])) {
    $cod_cancion = (int) $_GET['cod_cancion'];

    
    $consulta_eliminar_cancion = "DELETE FROM canciones WHERE cod_cancion = $cod_cancion";
    if (mysqli_query($conexion, $consulta_eliminar_cancion) && mysqli_affected_rows($conexion) > 0) {
        $_SESSION['mensaje'] = "Canción eliminada correctamente";
    } else {
        $_SESSION['mensaje'] = "Error: No se encontró la canción o no se pudo eliminar.";
    }

    header("Location: admin.php");
    exit();
} else {
    $_SESSION['mensaje'] = "Error: No se recibió el código de la canción.";
    header("Location: admin.php");
    exit();
}
?>
