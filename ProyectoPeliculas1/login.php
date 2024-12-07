<?php
session_start();

require 'database.php';

$message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!empty($_POST['email']) && !empty($_POST['password'])) {
        $records = $conn->prepare('SELECT idusuario, email, password FROM usuario WHERE email = :email');
        $records->bindParam(':email', $_POST['email']);
        $records->execute();
        $results = $records->fetch(PDO::FETCH_ASSOC);

        if ($results && password_verify($_POST['password'], $results['password'])) {
            $_SESSION['user_id'] = $results['idusuario'];
            header('Location: index.php');
            exit();
        } else {
            $message = 'Lo siento, esas credenciales no coinciden';
        }
    } else {
        $message = 'Por favor, complete todos los campos.';
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="icon" href="imagenes/Logo.png">
</head>
<body>
    <header>
        <h1>Tiempo de películas</h1>
    </header>
    <main>
        <div class="container">
            <div class="left">
                <img src="imagenes/logo1.png" alt="logo">
                <h2>Encuentra las mejores plataformas para tus películas</h2>
            </div>
            <div class="right">

                <?php if (!empty($message)): ?>
                    <p><?= $message ?></p>
                <?php endif; ?>

                <form action="home.php" method="POST">
                    <h2>Iniciar sesión</h2>
                    <label>Email</label>
                    <input type="text" name="email" placeholder="Ingrese su email*" required>
                    <label>Contraseña</label>
                    <input type="password" name="password" placeholder="Ingrese su contraseña*" required>
                    <input type="submit" value="Entrar">
                </form>
                <a href="register.php">Registrarse</a>
                <a href="home.php">Inicie sin una cuenta</a>
            </div>
        </div>
    </main>
</body>
</html>
