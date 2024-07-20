<?php
require 'database.php';

$message = '';

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
            $message = 'Lo siento, debe haber habido un problema al crear su cuenta';
        }
    } else {
        $message = 'Por favor, introduce un correo electrónico válido.';
    }
} else {
    $message = 'Por favor, complete todos los campos.';
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrarse</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

<?php
require 'partials/header.php' 
?>

<?php
if(!empty($message)): ?>
<p><?= $message ?></p>
<?php endif; ?>


    <h2>Registrarse</h2>
    <span>o <a href="login.php">Iniciar Sesión</a></span>
<!--utilizo el br para separar los input y que no queden en la misma linea, no se como hacerlo de otra manera-->
    <form action="signup.php" method="post">
        <input type="text" name="nombre" placeholder="Ingresa su nombre de usuario*"><br> </br>
        <input type="text" name="email" placeholder="Ingresa su email*"><br> </br>
        <input type="password" name="password" placeholder="Ingresa su contraseña*"><br> </br>
        <input type="submit" value="Registrarse">
    </form>

</body>
</html>