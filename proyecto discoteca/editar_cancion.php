<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    header("Location: index.php");
    exit();
}

$mensaje = "";
$cod_cancion = "";
$titulo = "";
$duracion = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['cod_cancion']) && !empty($_POST['cod_cancion'])) {
        $cod_cancion = $_POST['cod_cancion'];
    } else {
        $mensaje = "<p class='error'>Error: No se ha recibido el código de la canción.</p>";
    }

    if (empty($mensaje)) {
        $titulo = trim($_POST['titulo']);
        $duracion = $_POST['duracion'];

        
        if (empty($titulo)) {
            $mensaje = "<p class='error'>El campo TÍTULO no puede estar vacío.</p>";
        }

        if (empty($mensaje)) {
            $consulta_titulo = "SELECT cod_cancion FROM canciones WHERE titulo = '$titulo' AND cod_cancion != $cod_cancion";
            $resultado_titulo = mysqli_query($conexion, $consulta_titulo);

            if ($resultado_titulo && mysqli_num_rows($resultado_titulo) > 0) {
                $mensaje = "<p class='error'>Ya existe una canción con ese título.</p>";
            }
        }

        
        if (empty($mensaje)) {
            $consulta = "UPDATE canciones SET titulo='$titulo', duracion='$duracion' WHERE cod_cancion=$cod_cancion";

            if (mysqli_query($conexion, $consulta)) {
                header("Location: admin.php?mensaje=cancion_editada_correctamente");
                exit();
            } else {
                $mensaje = "<p class='error'>error_al_actualizar_la_canción.</p>";
            }
        }
    }
}

if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['cod_cancion']) && !empty($_GET['cod_cancion'])) {
    $cod_cancion = $_GET['cod_cancion'];
    $consulta = "SELECT * FROM canciones WHERE cod_cancion=$cod_cancion";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        $cancion = mysqli_fetch_array($resultado);
        $titulo = $cancion['titulo'];
        $duracion = $cancion['duracion'];
    } else {
        $mensaje = "<p class='error'>Error al cargar la canción.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar canción</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="editar-body">
    <div class="editar-container">
        <h2 class="editar-titulo">Editar canción</h2>

        <?php if (!empty($mensaje)) echo $mensaje; ?>

        <form action="editar_cancion.php" method="POST" class="editar-formulario">
            <input type="hidden" name="cod_cancion" value="<?php echo $cod_cancion; ?>">

            <label class="editar-label">Título:</label>
            <input type="text" maxlength="50" name="titulo" value="<?php echo $titulo; ?>" required class="editar-input">

            <label class="editar-label">Duración:</label>
            <input type="text" name="duracion" value="<?php echo $duracion; ?>" required class="editar-input">

            <button type="submit" class="editar-boton">Guardar cambios</button>
        </form>

        <a href="admin.php" class="editar-enlace">Volver al panel</a>
    </div>
</body>
</html>
