<?php
require 'database.php';

$message = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['nombre'])) {
        $nombre = htmlspecialchars(trim($_POST['nombre']));
        $email = filter_var(trim($_POST['email']), FILTER_SANITIZE_EMAIL);
        $password = password_hash(trim($_POST['password']), PASSWORD_BCRYPT);

        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $sql = "INSERT INTO usuario (nombre, email, password) VALUES (:nombre, :email, :password)";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':nombre', $nombre);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $password);

            if ($stmt->execute()) {
                $message = 'Nuevo usuario creado exitosamente';
            } else {
                $errorInfo = $stmt->errorInfo();
                $message = 'Lo siento, debe haber habido un problema al crear su cuenta: ' . $errorInfo[2];
            }
        } else {
            $message = 'Por favor, introduce un correo electrónico válido.';
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
    <title>Registrarse</title>
    <link rel="stylesheet" href="assets/css/register.css">
    <link rel="icon" href="imagenes/Logo.png">
</head>
<body>

<?php if (!empty($message)): ?>
<p><?= $message ?></p>
<?php endif; ?>

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
            <form action="" method="POST">
                <h2>Registrarse</h2>
                <label>Email</label>
                <input type="text" name="email" placeholder="Ingrese su email*" required>
                <label>Nombre de usuario</label>
                <input type="text" name="nombre" placeholder="Ingrese su nombre de usuario" required>
                <label>Contraseña</label>
                <input type="password" name="password" placeholder="Ingrese su contraseña*" required>
                <input type="submit" value="Registrarse">
            </form>
            <a href="login.php">Iniciar sesión</a>
            <a href="home.php">Inicie sin una cuenta</a>
        </div>
    </div>
</main>
</body>
</html>
