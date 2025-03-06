<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    exit("<p class='error'>Error: No tienes permiso para realizar esta acción.</p>");
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cod_album'])) {
    $cod_album = (int) $_POST['cod_album'];

    $consulta_portada = "SELECT portada FROM albumes WHERE cod_album = $cod_album";
    $resultado_portada = mysqli_query($conexion, $consulta_portada);
    $fila_portada = mysqli_fetch_array($resultado_portada);
    $portada = $fila_portada['portada'];

    if (!empty($portada)) {
        $consulta_uso_portada = "SELECT COUNT(*) AS total FROM albumes WHERE portada = '$portada' AND cod_album != $cod_album";
        $resultado_uso_portada = mysqli_query($conexion, $consulta_uso_portada);
        $fila_uso_portada = mysqli_fetch_array($resultado_uso_portada);

        if ($fila_uso_portada['total'] == 0) {
            $ruta_portada = "media/img/albumes/" . $portada;
            if (file_exists($ruta_portada)) {
                unlink($ruta_portada);
            }
        }
    }

    $consulta_eliminar_album = "DELETE FROM albumes WHERE cod_album = $cod_album";
    if (mysqli_query($conexion, $consulta_eliminar_album)) {
        $_SESSION['mensaje'] = "Álbum eliminado correctamente";
    } else {
        $_SESSION['mensaje'] = "Error al eliminar el álbum";
    }

    header("Location: admin.php");
    exit();
}
?>
