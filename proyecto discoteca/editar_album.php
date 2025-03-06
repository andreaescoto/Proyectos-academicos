<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    header("Location: index.php");
    exit();
}

$mensaje = "";
$cod_album = "";
$titulo = "";
$fecha = "";
$cod_grupo = "";
$portada = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cod_album = $_POST['cod_album'] ?? null;
    if (!$cod_album) {
        $mensaje = "<p class='error'>Error: No se ha recibido el código del álbum.</p>";
    }

    if (empty($mensaje)) {
        $titulo = trim($_POST['titulo']);
        $fecha = trim($_POST['fecha']);
        $cod_grupo = $_POST['cod_grupo'] != "" ? $_POST['cod_grupo'] : "NULL";

        if ($fecha == "") {
            $mensaje = "<p class='error'>El campo AÑO no puede estar vacío.</p>";
        }

        if (empty($mensaje)) {
            $consulta_portada_actual = "SELECT portada FROM albumes WHERE cod_album = $cod_album";
            $resultado_portada_actual = mysqli_query($conexion, $consulta_portada_actual);

            if ($resultado_portada_actual) {
                $fila_portada = mysqli_fetch_array($resultado_portada_actual);
                $portada = $fila_portada['portada'];
            } else {
                $mensaje = "<p class='error'>Error al obtener la portada actual.</p>";
            }
        }

        if (empty($mensaje)) {
            $consulta_titulo = "SELECT cod_album FROM albumes WHERE titulo = '$titulo' AND cod_album != $cod_album";
            $resultado_titulo = mysqli_query($conexion, $consulta_titulo);

            if ($resultado_titulo && mysqli_num_rows($resultado_titulo) > 0) {
                $mensaje = "<p class='error'>Ya existe un álbum con ese título.</p>";
            }
        }

        if (empty($mensaje) && !empty($_FILES['portada']['name'])) {
            $nueva_portada = $_FILES['portada']['name'];
            $tmp = $_FILES['portada']['tmp_name'];
            $type = $_FILES['portada']['type'];
            $destino = "media/img/albumes/" . $nueva_portada;

            if (strlen($nueva_portada) > 10) {
                $mensaje = "<p class='error'>El nombre de la imagen no puede superar los 10 caracteres incluyendo la extensión.</p>";
            } else {
                $consulta_portada = "SELECT cod_album FROM albumes WHERE portada = '$nueva_portada' AND cod_album != $cod_album";
                $resultado_portada = mysqli_query($conexion, $consulta_portada);

                if ($resultado_portada && mysqli_num_rows($resultado_portada) > 0) {
                    $mensaje = "<p class='error'>Ya existe un álbum con esa imagen. Por favor, sube otra.</p>";
                } else {
                    if (!file_exists("media/img/albumes")) {
                        mkdir("media/img/albumes", 0777, true);
                    }

                    if ($type == "image/jpeg") {
                        move_uploaded_file($tmp, $destino);
                        $portada = $nueva_portada;
                    } else {
                        $mensaje = "<p class='error'>Solo se permiten imágenes en formato JPG.</p>";
                    }
                }
            }
        }

        if (empty($mensaje)) {
            $consulta = "UPDATE albumes SET titulo='$titulo', fecha='$fecha', cod_grupo=$cod_grupo, portada='$portada' WHERE cod_album=$cod_album";

            if (mysqli_query($conexion, $consulta)) {
                header("Location: admin.php?mensaje=album_editado_correctamente");
                exit();
            } else {
                $mensaje = "<p class='error'>Error al actualizar el álbum.</p>";
            }
        }
    }
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['cod_album']) && !empty($_GET['cod_album'])) {
    $cod_album = $_GET['cod_album'];
    $consulta = "SELECT * FROM albumes WHERE cod_album=$cod_album";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        $album = mysqli_fetch_array($resultado);
        $titulo = $album['titulo'];
        $fecha = $album['fecha'];
        $cod_grupo = $album['cod_grupo'];
        $portada = $album['portada'];
    } else {
        $mensaje = "<p class='error'>Error al cargar el álbum.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar álbum</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="editar-body">
    <div class="editar-container">
        <h2 class="editar-titulo">Editar álbum</h2>

        <?php if (!empty($mensaje)) echo $mensaje; ?>

        <form action="editar_album.php" method="POST" enctype="multipart/form-data" class="editar-formulario">
            <input type="hidden" name="cod_album" value="<?php echo $cod_album; ?>">

            <label class="editar-label">Título:</label>
            <input type="text" maxlength="50" name="titulo" value="<?php echo $titulo; ?>" required class="editar-input">

            <label class="editar-label">Año:</label>
            <input type="text" name="fecha" value="<?php echo $fecha; ?>" pattern="\d{4}" required class="editar-input">

            <label class="editar-label">Grupo al que pertenece:</label>
            <select name="cod_grupo" class="editar-input">
                <option value="">Sin grupo</option>
                <?php
                $consulta_grupos = "SELECT cod_grupo, nombre FROM grupos";
                $resultado_grupos = mysqli_query($conexion, $consulta_grupos);
                while ($grupo = mysqli_fetch_array($resultado_grupos)) {
                    $selected = ($grupo['cod_grupo'] == $cod_grupo) ? "selected" : "";
                    echo "<option value='{$grupo['cod_grupo']}' $selected>{$grupo['nombre']}</option>";
                }
                ?>
            </select>

            <label class="editar-label">Portada actual:</label>
            <?php if (!empty($portada) && file_exists("media/img/albumes/" . $portada)): ?>
                <img src="media/img/albumes/<?php echo $portada; ?>" class="editar-img">
            <?php else: ?>
                <p class="editar-label">No hay portada</p>
            <?php endif; ?>

            <label class="editar-label">Subir nueva portada (solo JPG, máx. 10 caracteres en el nombre):</label>
            <input type="file" name="portada" class="editar-input" accept=".jpg, .jpeg">

            <button type="submit" class="editar-boton">Guardar cambios</button>
        </form>

        <a href="admin.php" class="editar-enlace">Volver al panel</a>
    </div>
</body>
</html>
