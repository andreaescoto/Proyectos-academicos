<?php
session_start();
require('conexion_discoteca.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!isset($_POST['user']) || !isset($_POST['pass'])) {
        header("Location: index.php?mensaje=faltan_datos");
        exit();
    }

    $conexion = mysqli_connect($servidor, $usuario, $password, $bbdd);
    
    if (!$conexion) {
        die("Error de conexión: " . mysqli_connect_error());
    }

    $user = $_POST['user'];
    $pass = $_POST['pass'];

    $consulta = "SELECT user FROM usuarios WHERE user = '$user' AND AES_DECRYPT(pass, 'almandrullos') = '$pass'";
    $resultado = mysqli_query($conexion, $consulta);

    if (mysqli_num_rows($resultado) > 0) {
        $_SESSION['logueado'] = true;
        $_SESSION['username'] = $user;
        $_SESSION['hora'] = time();
        $_SESSION['timeout'] = time();
        header("Location: admin.php");
        exit();
    } else {
        header("Location: index.php?mensaje=error");
        exit();
    }
}

mysqli_close($conexion);
?>
