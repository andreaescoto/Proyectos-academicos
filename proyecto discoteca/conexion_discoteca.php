<?php

$servidor = "mysql.webcindario.com";
$usuario = "discotecaweb";
$password = "PwZBS6TM4J";
$bbdd = "discotecaweb";

$conexion = mysqli_connect($servidor, $usuario, $password, $bbdd);
if (!$conexion) {
    die("Error en la conexión: " . mysqli_connect_error());
}
mysqli_query($conexion, "SET NAMES 'UTF8'");
?>