<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    header("Location: index.php");
    exit();
}

$mensaje = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = trim($_POST['nombre']);
    $nacionalidad = $_POST['nacionalidad'];
    $biografia = $_POST['biografia'];

    try {
        $consulta_existencia = "SELECT COUNT(*) FROM grupos WHERE nombre = '$nombre'";
        $resultado_existencia = mysqli_query($conexion, $consulta_existencia);
        $fila_existencia = mysqli_fetch_array($resultado_existencia);
        
        if ($fila_existencia[0] > 0) {
            throw new Exception("<p class='error'>Ya existe un grupo con este nombre.</p>");
        }

        $consulta_max = "SELECT COALESCE(MAX(cod_grupo), 0) + 1 AS nuevo_cod_grupo FROM grupos";
        $resultado_max = mysqli_query($conexion, $consulta_max);
        $fila_max = mysqli_fetch_array($resultado_max);
        $nuevo_cod_grupo = $fila_max['nuevo_cod_grupo'];

        $foto = "";

        if (!empty($_FILES['foto']['name'])) {
            $nombre_original = $_FILES['foto']['name'];
            $extension = strtolower(pathinfo($nombre_original, PATHINFO_EXTENSION));

            if ($extension != "jpg" && $extension != "jpeg") {
                throw new Exception("<p class='error'>Solo se permiten imágenes en formato JPG.</p>");
            }

            if (strlen($nombre_original) > 10) {
                throw new Exception("<p class='error'>El nombre de la imagen no puede superar los 10 caracteres incluyendo la extensión.</p>");
            }

            $destino = "media/img/grupos/" . $nombre_original;

            if (file_exists($destino)) {
                throw new Exception("<p class='error'>Ya existe una imagen con ese nombre en la carpeta. Elige otro archivo.</p>");
            }

            if (!file_exists("media/img/grupos")) {
                mkdir("media/img/grupos", 0777, true);
            }

            if (!move_uploaded_file($_FILES['foto']['tmp_name'], $destino)) {
                throw new Exception("<p class='error'>Hubo un error al subir la imagen.</p>");
            }

            $foto = $nombre_original;
        }

        $consulta = "INSERT INTO grupos (cod_grupo, nombre, nacionalidad, biografia, foto) 
                     VALUES ('$nuevo_cod_grupo', '$nombre', '$nacionalidad', '$biografia', '$foto')";

        if (!mysqli_query($conexion, $consulta)) {
            throw new Exception("<p class='error'>Error al agregar el grupo: " . mysqli_error($conexion) . "</p>");
        }

        header("Location: admin.php?mensaje=grupo_agregado_correctamente");
        exit();
    } catch (Exception $e) {
        $mensaje = $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar grupo</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="agregar-body">
    <div class="agregar-container">
        <h2 class="agregar-titulo">Agregar nuevo grupo</h2>
        <?php echo $mensaje; ?>
        <form action="agregar_grupo.php" method="POST" enctype="multipart/form-data" class="agregar-form">
            <label class="agregar-label">Nombre:</label>
            <input type="text" maxlength="50" name="nombre" required class="agregar-input">

            <label class="agregar-label">Nacionalidad:</label>
            <input type="text" maxlength="35" name="nacionalidad" required class="agregar-input">

            <label class="agregar-label">Biografía:</label>
            <textarea name="biografia" maxlength="500" required class="agregar-textarea"></textarea>

            <label class="agregar-label">Foto (obligatoria, solo JPG, máx. 10 caracteres en el nombre):</label>
            <input type="file" name="foto" class="agregar-input" accept=".jpg, .jpeg" required>

            <button type="submit" class="agregar-boton">Agregar grupo</button>
        </form>
        <a href="admin.php" class="agregar-enlace">Volver al panel</a>
    </div>
</body>
</html>
