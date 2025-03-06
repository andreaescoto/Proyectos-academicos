<?php
session_start();
if (isset($_SESSION['logueado']) && $_SESSION['logueado'] == true) {
    header("Location: admin.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body class="login-body">
    <div class="login-container">
        <h2 class="login-titulo">Iniciar sesión</h2>
        
        <?php
        if (isset($_GET['mensaje'])) {
            echo "<p class='login-error'>";
            if ($_GET['mensaje'] == "caducada") {
                echo "Sesión expirada por tiempo.";
            } elseif ($_GET['mensaje'] == "inactividad") {
                echo "Sesión expirada por inactividad.";
            } elseif ($_GET['mensaje'] == "error") {
                echo "Usuario o contraseña incorrectos.";
            }
            echo "</p>";
        }
        ?>
        
        <form action="login.php" method="POST" class="login-form"> 
            <label for="user" class="login-label">Usuario:</label>
            <input type="text" id="user" name="user" class="login-input" required>

            <label for="pass" class="login-label">Contraseña:</label>
            <input type="password" id="pass" name="pass" class="login-input" required>

            <button type="submit" class="login-button">Ingresar</button>
        </form>
    </div>
</body>
</html>
