<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    header("Location: index.php");
    exit();
}

$mensaje = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titulo = trim($_POST['titulo']);
    $fecha = $_POST['fecha'];
    $cod_grupo = isset($_POST['cod_grupo']) && $_POST['cod_grupo'] != "" ? $_POST['cod_grupo'] : null;

    try {
        
        if ($cod_grupo == null) {
            throw new Exception("<p class='error'>Debes seleccionar un grupo para el álbum.</p>");
        }

        
        $consulta_existencia = "SELECT cod_album FROM albumes WHERE titulo = '$titulo'";
        $resultado_existencia = mysqli_query($conexion, $consulta_existencia);
        if (mysqli_num_rows($resultado_existencia) > 0) {
            throw new Exception("<p class='error'>Ya existe un álbum con este título. Por favor, elige otro nombre.</p>");
        }

       
        if (empty($_FILES['portada']['name'])) {
            throw new Exception("<p class='error'>Debes subir una imagen para la portada del álbum.</p>");
        }

        
        $nombre_original = $_FILES['portada']['name'];
        $extension = strtolower(pathinfo($nombre_original, PATHINFO_EXTENSION));

        if ($extension != "jpg" && $extension != "jpeg") {
            throw new Exception("<p class='error'>Solo se permiten imágenes en formato JPG.</p>");
        }

        
        if (strlen($nombre_original) > 10) {
            throw new Exception("<p class='error'>El nombre de la imagen no puede superar los 10 caracteres incluyendo la extensión.</p>");
        }

        
        $consulta_max = "SELECT COALESCE(MAX(cod_album), 0) + 1 AS nuevo_cod_album FROM albumes";
        $resultado_max = mysqli_query($conexion, $consulta_max);
        $fila_max = mysqli_fetch_array($resultado_max);
        $nuevo_cod_album = $fila_max['nuevo_cod_album'];

        $destino = "media/img/albumes/" . $nombre_original;

        
        if (file_exists($destino)) {
            throw new Exception("<p class='error'>Ya existe una imagen con ese nombre. Por favor, elige otra.</p>");
        }

        
        if (!file_exists("media/img/albumes")) {
            mkdir("media/img/albumes", 0777, true);
        }

        
        if (!move_uploaded_file($_FILES['portada']['tmp_name'], $destino)) {
            throw new Exception("<p class='error'>Hubo un error al subir la imagen.</p>");
        }

        
        $consulta = "INSERT INTO albumes (cod_album, titulo, fecha, cod_grupo, portada) 
                     VALUES ('$nuevo_cod_album', '$titulo', '$fecha', $cod_grupo, '$nombre_original')";

        if (!mysqli_query($conexion, $consulta)) {
            throw new Exception("Error al agregar el álbum: " . mysqli_error($conexion));
        }

        header("Location: admin.php?mensaje=album_agregado_correctamente");
        exit();
    } catch (Exception $e) {
        $mensaje = "<p class='error'>" . $e->getMessage() . "</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar álbum</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="agregar-body">
    <div class="agregar-container">
        <h2 class="agregar-titulo">Agregar nuevo álbum</h2>
        <?php echo $mensaje; ?>
        <form action="agregar_album.php" method="POST" enctype="multipart/form-data" class="agregar-form">
            <label class="agregar-label">Título:</label>
            <input type="text" maxlength="50" name="titulo" required class="agregar-input">
            
            <label class="agregar-label">Fecha de lanzamiento:</label>
            <input type="date" name="fecha" required class="agregar-input">
            
            <label class="agregar-label">Grupo al que pertenece:</label>
            <select name="cod_grupo" required class="agregar-input">
                <option value="" disabled selected>Selecciona un grupo</option>
                <?php
                $consulta_grupos = "SELECT cod_grupo, nombre FROM grupos";
                $resultado_grupos = mysqli_query($conexion, $consulta_grupos);
                while ($fila = mysqli_fetch_assoc($resultado_grupos)) {
                    echo "<option value='{$fila['cod_grupo']}'>{$fila['nombre']}</option>";
                }
                ?>
            </select>

            <label class="agregar-label">Portada (Solo JPG, máx. 10 caracteres en el nombre):</label>
            <input type="file" name="portada" required class="agregar-input" accept=".jpg, .jpeg">

            <button type="submit" class="agregar-boton">Guardar álbum</button>
        </form>

        <a href="admin.php" class="agregar-enlace">Volver al panel</a>
    </div>
</body>
</html>
