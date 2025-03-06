<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

try {
    if (!isset($_SESSION['logueado']) || $_SESSION['logueado'] != true) {
        session_destroy();
        header("Location: index.php");
        exit();
    }

    if ($_SESSION['hora'] + 600 < time()) {
        session_destroy();
        header("Location: index.php?mensaje=caducada");
        exit();
    }

    if (isset($_SESSION['timeout']) && (time() - $_SESSION['timeout']) > 500) {
        session_destroy();
        header("Location: index.php?mensaje=inactividad");
        exit();
    }

    $_SESSION['timeout'] = time();

    require('conexion_discoteca.php');

    $consulta_grupos = "SELECT * FROM grupos ORDER BY cod_grupo;";
    $resultado_grupos = mysqli_query($conexion, $consulta_grupos);
    if (!$resultado_grupos) {
        throw new Exception("Error en la consulta de grupos: " . mysqli_error($conexion));
    }

    $consulta_albumes = "SELECT * FROM albumes ORDER BY fecha ASC;";
    $resultado_albumes = mysqli_query($conexion, $consulta_albumes);
    if (!$resultado_albumes) {
        throw new Exception("Error en la consulta de álbumes: " . mysqli_error($conexion));
    }

    $consulta_canciones = "
        SELECT c.cod_cancion, c.titulo AS cancion_titulo, c.duracion, c.num_pista, 
               a.titulo AS album_titulo, a.fecha, g.nombre AS grupo_nombre 
        FROM canciones c
        INNER JOIN albumes a ON c.cod_album = a.cod_album
        INNER JOIN grupos g ON a.cod_grupo = g.cod_grupo
        ORDER BY c.num_pista ASC
    ";
    $resultado_canciones = mysqli_query($conexion, $consulta_canciones);
    if (!$resultado_canciones) {
        throw new Exception("Error en la consulta de canciones: " . mysqli_error($conexion));
    }
} catch (Exception $e) {
    error_log($e->getMessage());
    echo "<p class='error'>Error en el sistema. Por favor, intenta más tarde.</p>";
    exit();
}
?>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Centro de control musical</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="admin-body">
    <header>
        <img src="media/img/cabecera.jpg" alt="Cabecera">
        <h1>Manejo de tu música</h1>
        <a href="salir.php">Cerrar sesión</a>
    </header>
    
    <nav>
        <button onclick="mostrarSeccion('grupos')">Grupos</button>
        <button onclick="mostrarSeccion('albumes')">Álbumes</button>
        <button onclick="mostrarSeccion('canciones')">Canciones</button>
    </nav>
    
    <main>
                <!-- Sección de grupos -->
        <section id="grupos" class="seccion">
            <h2>Gestión de grupos</h2>
            <a href="agregar_grupo.php">
                <img src="media/img/agregar.png" alt="Agregar" title="Agregar">
                Agregar nuevo grupo
            </a>
            <div class="grid-container">
                <?php while ($fila = mysqli_fetch_array($resultado_grupos)): ?>
                    <div class="card">
                        <img src="media/img/grupos/<?php echo $fila['foto']; ?>" alt="Foto del grupo">
                        <div class="card-content">
                            <h3><?php echo $fila['nombre']; ?></h3>
                            <p>Nacionalidad: <?php echo $fila['nacionalidad']; ?></p>
                            <p class="bio">Biografía: <?php echo $fila['biografia']; ?></p>
                        </div>
                        <div class="acciones">
                            <a href="editar_grupo.php?cod_grupo=<?php echo $fila['cod_grupo']; ?>">
                                <img src="media/img/editar.png" alt="Editar" title="Editar">
                            </a>
                            <a href="#" onclick="eliminar(<?php echo $fila['cod_grupo']; ?>); return false;">
                                <img src="media/img/eliminar.png" alt="Eliminar" title="Eliminar">
                            </a>
                        </div>
                        <form id="formEliminar<?php echo $fila['cod_grupo']; ?>" action="eliminar_grupo.php" method="POST" style="display: none;">
                            <input type="hidden" name="cod_grupo" value="<?php echo $fila['cod_grupo']; ?>">
                        </form>
                    </div>
                <?php endwhile; ?>
            </div>
        </section>
        
        <!-- Sección de álbumes -->
        <section id="albumes" class="seccion" style="display:none;">
            <h2>Gestión de álbumes</h2>
            <a href="agregar_album.php">
                <img src="media/img/agregar.png" alt="Agregar" title="Agregar">
                Agregar nuevo álbum
            </a>
            <div class="grid-container">
                <?php while ($fila = mysqli_fetch_array($resultado_albumes)): ?>
                    <div class="card">
                        <img src="media/img/albumes/<?php echo $fila['portada']; ?>" alt="Portada del álbum">
                        <div class="card-content">
                            <h3><?php echo $fila['titulo']; ?></h3>
                            <p>Fecha: <?php echo $fila['fecha']; ?></p>
                        </div>
                        <div class="acciones">
                            <a href="editar_album.php?cod_album=<?php echo $fila['cod_album']; ?>">
                                <img src="media/img/editar.png" alt="Editar" title="Editar">
                            </a>
                            <a href="#" onclick="eliminarAlbum(<?php echo $fila['cod_album']; ?>); return false;">
                                <img src="media/img/eliminar.png" alt="Eliminar" title="Eliminar">
                            </a>
                        </div>
                        <form id="formEliminarAlbum<?php echo $fila['cod_album']; ?>" action="eliminar_album.php" method="POST" style="display: none;">
                            <input type="hidden" name="cod_album" value="<?php echo $fila['cod_album']; ?>">
                        </form>
                    </div>
                <?php endwhile; ?>
            </div>
        </section>

        <!-- Sección de canciones -->
		<section id="canciones" class="seccion">
		    <h2>Gestión de canciones</h2>
		    <a href="agregar_cancion.php">
		        <img src="media/img/agregar.png" alt="Agregar" title="Agregar">
		        Agregar nueva canción
		    </a>
		    <table>
		        <thead>
		            <tr>
		                <th>Título</th>
		                <th>Álbum</th>
		                <th>Duración</th>
		                <th>Número de pista</th>
		                <th>Acciones</th>
		            </tr>
		        </thead>
		        <tbody>
		            <?php while ($fila = mysqli_fetch_assoc($resultado_canciones)): ?>
		                <tr>
		                    <td><?php echo $fila['cancion_titulo']; ?></td>
		                    <td><?php echo $fila['album_titulo']; ?></td>
		                    <td><?php echo $fila['duracion']; ?></td>
		                    <td><?php echo $fila['num_pista']; ?></td>
		                    <td class="acciones">
		                        <a href="editar_cancion.php?cod_cancion=<?php echo $fila['cod_cancion']; ?>">
		                            <img src="media/img/editar.png" alt="Editar" title="Editar">
		                        </a>
		                        <a href="eliminar_cancion.php?cod_cancion=<?php echo $fila['cod_cancion']; ?>" onclick="return confirm('¿Estás seguro de que quieres eliminar esta canción?');">
		                            <img src="media/img/eliminar.png" alt="Eliminar" title="Eliminar">
		                        </a>
		                    </td>
		                </tr>
		            <?php endwhile; ?>
		        </tbody>
		    </table>
		</section>
    </main>

    <script>
        function mostrarSeccion(seccion) {
            document.querySelectorAll('.seccion').forEach(sec => sec.style.display = 'none');
            document.getElementById(seccion).style.display = 'block';
        }

        function eliminar(codGrupo) {
		    if (confirm("¿Estás seguro de que quieres eliminar este grupo? Se eliminarán todos sus álbumes y canciones.")) {
		        var form = document.createElement("form");
		        form.method = "POST";
		        form.action = "eliminar_grupo.php";

		        var input = document.createElement("input");
		        input.type = "hidden";
		        input.name = "cod_grupo";
		        input.value = codGrupo;

		        form.appendChild(input);
		        document.body.appendChild(form);
		        form.submit();
		    }
		}

		function eliminarAlbum(codAlbum) {
	        if (confirm("¿Estás seguro de que quieres eliminar este álbum? Se eliminarán todas sus canciones.")) {
	            document.getElementById("formEliminarAlbum" + codAlbum).submit();
	        }
	    }
    </script>
</body>
</html>

<?php mysqli_close($conexion); ?>