<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    header("Location: index.php");
    exit();
}

$mensaje = "";
$cod_grupo = "";
$nombre = "";
$nacionalidad = "";
$biografia = "";
$foto = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cod_grupo = $_POST['cod_grupo'] ?? null;
    if (!$cod_grupo) {
        $mensaje = "<p class='error'>Error: No se ha recibido el código del grupo.</p>";
    }

    if (empty($mensaje)) {
        $nombre = trim($_POST['nombre']);
        $nacionalidad = trim($_POST['nacionalidad']);
        $biografia = trim($_POST['biografia']);

        if ($nombre == "") {
            $mensaje = "<p class='error'>El campo NOMBRE no puede estar vacío.</p>";
        }

        if (empty($mensaje)) {
            $consulta_foto_actual = "SELECT foto FROM grupos WHERE cod_grupo = $cod_grupo";
            $resultado_foto_actual = mysqli_query($conexion, $consulta_foto_actual);

            if ($resultado_foto_actual) {
                $fila_foto = mysqli_fetch_array($resultado_foto_actual);
                $foto = $fila_foto['foto'];
            } else {
                $mensaje = "<p class='error'>Error al obtener la foto actual.</p>";
            }
        }

        if (empty($mensaje)) {
            $consulta_nombre = "SELECT cod_grupo FROM grupos WHERE nombre = '$nombre' AND cod_grupo != $cod_grupo";
            $resultado_nombre = mysqli_query($conexion, $consulta_nombre);

            if ($resultado_nombre && mysqli_num_rows($resultado_nombre) > 0) {
                $mensaje = "<p class='error'>Ya existe un grupo con ese nombre.</p>";
            }
        }

        if (empty($mensaje) && !empty($_FILES['archivo']['name'])) {
            $nueva_foto = $_FILES['archivo']['name'];
            $tmp = $_FILES['archivo']['tmp_name'];
            $type = $_FILES['archivo']['type'];
            $destino = "media/img/grupos/" . $nueva_foto;

            if ($nueva_foto !== $foto) {
                if (strlen($nueva_foto) > 10) {
                    $mensaje = "<p class='error'>El nombre de la imagen no puede superar los 10 caracteres incluyendo la extensión.</p>";
                } else {
                    $consulta_foto = "SELECT cod_grupo FROM grupos WHERE foto = '$nueva_foto' AND cod_grupo != $cod_grupo";
                    $resultado_foto = mysqli_query($conexion, $consulta_foto);

                    if ($resultado_foto && mysqli_num_rows($resultado_foto) > 0) {
                        $mensaje = "<p class='error'>Ya existe un grupo con esa imagen. Por favor, sube otra.</p>";
                    } else {
                        if (!file_exists("media/img/grupos")) {
                            mkdir("media/img/grupos", 0777, true);
                        }

                        if ($type == "image/jpeg") {
                            move_uploaded_file($tmp, $destino);
                            $foto = $nueva_foto;
                        } else {
                            $mensaje = "<p class='error'>Solo se permiten imágenes en formato JPG.</p>";
                        }
                    }
                }
            }
        }

        if (empty($mensaje)) {
            $consulta = "UPDATE grupos SET nombre='$nombre', nacionalidad='$nacionalidad', biografia='$biografia', foto='$foto' WHERE cod_grupo=$cod_grupo";

            if (mysqli_query($conexion, $consulta)) {
                header("Location: admin.php?mensaje=grupo_editado_correctamente");
                exit();
            } else {
                $mensaje = "<p class='error'>Error al actualizar el grupo.</p>";
            }
        }
    }
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['cod_grupo']) && !empty($_GET['cod_grupo'])) {
    $cod_grupo = $_GET['cod_grupo'];
    $consulta = "SELECT * FROM grupos WHERE cod_grupo=$cod_grupo";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        $grupo = mysqli_fetch_array($resultado);
        $nombre = $grupo['nombre'];
        $nacionalidad = $grupo['nacionalidad'];
        $biografia = $grupo['biografia'];
        $foto = $grupo['foto'];
    } else {
        $mensaje = "<p class='error'>Error al cargar el grupo.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar grupo</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="editar-body">
    <div class="editar-container">
        <h2 class="editar-titulo">Editar grupo</h2>

        <?php if (!empty($mensaje)) echo $mensaje; ?>

        <form action="editar_grupo.php" method="POST" enctype="multipart/form-data" class="editar-formulario">
            <input type="hidden" name="cod_grupo" value="<?php echo $cod_grupo; ?>">

            <label class="editar-label">Nombre:</label>
            <input type="text" maxlength="50" name="nombre" value="<?php echo $nombre; ?>" required class="editar-input">

            <label class="editar-label">Nacionalidad:</label>
            <input type="text" maxlength="35" name="nacionalidad" value="<?php echo $nacionalidad; ?>" required class="editar-input">

            <label class="editar-label">Biografía:</label>
            <textarea name="biografia" maxlength="500" required class="editar-textarea"><?php echo $biografia; ?></textarea>

            <label class="editar-label">Foto actual:</label>
            <?php if (!empty($foto) && file_exists("media/img/grupos/" . $foto)): ?>
                <img src="media/img/grupos/<?php echo $foto; ?>" class="editar-img">
            <?php else: ?>
                <p class="editar-label">No hay foto</p>
            <?php endif; ?>

            <label class="editar-label">Subir nueva foto (solo JPG, máx. 10 caracteres en el nombre):</label>
            <input type="file" name="archivo" class="editar-input" accept=".jpg, .jpeg">

            <button type="submit" class="editar-boton">Guardar cambios</button>
        </form>

        <a href="admin.php" class="editar-enlace">Volver al panel</a>
    </div>
</body>
</html>
