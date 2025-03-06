<?php
session_start();
require('conexion_discoteca.php');

if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
    header("Location: index.php");
    exit();
}

$conexion = mysqli_connect($servidor, $usuario, $password, $bbdd);
mysqli_query($conexion, "SET NAMES 'UTF8'");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $titulo = trim($_POST['titulo']);
    $duracion = trim($_POST['duracion']);
    $num_pista = (int) $_POST['num_pista'];
    $cod_album = trim($_POST['cod_album']);

    $mensaje = "";

    if (empty($titulo) || empty($duracion) || empty($num_pista) || empty($cod_album)) {
        $mensaje = "<p class='error'>Todos los campos son obligatorios.</p>";
    } else {
        
        $consulta_album = "SELECT cod_album FROM albumes WHERE cod_album = '$cod_album'";
        $resultado_album = mysqli_query($conexion, $consulta_album);

        if (mysqli_num_rows($resultado_album) == 0) {
            $mensaje = "<p class='error'>El álbum seleccionado no es válido.</p>";
        } else {
            
            $consulta_titulo = "SELECT * FROM canciones WHERE titulo = '$titulo' AND cod_album = '$cod_album'";
            $resultado_titulo = mysqli_query($conexion, $consulta_titulo);

            if (mysqli_num_rows($resultado_titulo) > 0) {
                $mensaje = "<p class='error'>El título de la canción ya existe en este álbum. Usa otro.</p>";
            } else {
                
                $consulta_max_cod = "SELECT MAX(cod_cancion) AS max_cod FROM canciones";
                $resultado_max_cod = mysqli_query($conexion, $consulta_max_cod);
                $fila_max_cod = mysqli_fetch_assoc($resultado_max_cod);
                $cod_cancion = $fila_max_cod['max_cod'] != null ? $fila_max_cod['max_cod'] + 1 : 1;

                
                $consulta_pista = "SELECT * FROM canciones WHERE num_pista = $num_pista AND cod_album = $cod_album";
                $resultado_pista = mysqli_query($conexion, $consulta_pista);

                if (mysqli_num_rows($resultado_pista) > 0) {
                    $mensaje = "<p class='error'>El número de pista ya está en uso en este álbum. Usa otro.</p>";
                } else {
                    
                    $insertar = "INSERT INTO canciones (cod_cancion, titulo, duracion, num_pista, cod_album) 
                                 VALUES ($cod_cancion, '$titulo', '$duracion', $num_pista, $cod_album)";

                    if (mysqli_query($conexion, $insertar)) {
                        header("Location: admin.php?mensaje=canción_agregada_correctamente");
                        exit();
                    } else {
                        header("Location: admin.php?mensaje=error_al_agregar_la_canción");
                        exit();
                    }
                }
            }
        }
    }
}

$consulta_albumes = "SELECT * FROM albumes ORDER BY fecha DESC";
$resultado_albumes = mysqli_query($conexion, $consulta_albumes);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar canción</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="agregar-body">
    <div class="agregar-container">
        <h2 class="agregar-titulo">Agregar nueva canción</h2>
        <?php if (!empty($mensaje)) echo $mensaje; ?>
        <form action="agregar_cancion.php" method="POST" class="agregar-form">
            <label class="agregar-label">Título:</label>
            <input type="text" maxlength="50" name="titulo" required class="agregar-input">

            <label class="agregar-label">Duración:</label>
            <input type="text" name="duracion" placeholder="Formato: hh:mm:ss" required class="agregar-input"
                   pattern="^[0-9]{2}:[0-5][0-9]:[0-5][0-9]$" title="Formato correcto: hh:mm:ss">

            <label class="agregar-label">Número de pista:</label>
            <input type="number" name="num_pista" required class="agregar-input" min="1" max="30">

            <label class="agregar-label">Álbum:</label>
            <select name="cod_album" required class="agregar-input">
                <option value="">Selecciona un álbum</option>
                <?php while ($album = mysqli_fetch_assoc($resultado_albumes)): ?>
                    <option value="<?php echo $album['cod_album']; ?>">
                        <?php echo $album['titulo']; ?>
                    </option>
                <?php endwhile; ?>
            </select>

            <button type="submit" class="agregar-boton">Agregar canción</button>
        </form>
        <a href="admin.php" class="agregar-enlace">Volver al panel</a>
    </div>
</body>
</html>

<?php mysqli_close($conexion); ?>
