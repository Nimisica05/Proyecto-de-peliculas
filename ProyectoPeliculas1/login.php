<?php
session_start();

require 'database.php';

$message = '';  

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
    $message = 'Por favor, complete ambos campos';
}

// Mostrar el mensaje de error o de éxito
if (!empty($message)) {
    echo "<p>$message</p>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iniciar sesion</title>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
<?php
    require 'partials/header.php'; 
?> 
<!--utilizo el div para separar la pgaina en 2, quiero que sea parte del estilo, se ve bien -->
    <div class="container">
        <div class="left"> 
            <img src="imagenes/Logo.png" alt="Logo" width="480" height="350">
            <h3>Encuentra las mejores plataformas para tus peliculas</h3>
        </div>
        <div class="right">
        <h2>Iniciar Sesión</h2>
        <span>o <a href="signup.php">Registrarse</a></span>

<?php
if (!empty($message)): ?>
<p><?= $message ?></p>
<?php endif; ?>        

            <form action="login.php" method="post">
                <input type="text" name="email" placeholder="Ingrese su email*">
                <input type="password" name="password" placeholder="Ingrese su contraseña*">
                <input type="submit" value="Entrar">
            </form>
        </div>
    </div>
</body>
</html>
