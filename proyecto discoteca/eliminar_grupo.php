<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    exit("error: No tienes permiso para realizar esta acción.");
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cod_grupo'])) {
    $cod_grupo = $_POST['cod_grupo'];


    $consulta_foto = "SELECT foto FROM grupos WHERE cod_grupo = $cod_grupo";
    $resultado_foto = mysqli_query($conexion, $consulta_foto);
    $fila_foto = mysqli_fetch_array($resultado_foto);
    $ruta_foto = "media/img/grupos/" . $fila_foto[0];

    if (file_exists($ruta_foto)) {
        unlink($ruta_foto);
    }


    $consulta_eliminar = "DELETE FROM grupos WHERE cod_grupo = $cod_grupo";
    if (mysqli_query($conexion, $consulta_eliminar)) {
        $_SESSION['mensaje'] = "Grupo eliminado correctamente";
    } else {
        $_SESSION['mensaje'] = "Error al eliminar el grupo";
    }

    header("Location: admin.php");
    exit();
}
?>
