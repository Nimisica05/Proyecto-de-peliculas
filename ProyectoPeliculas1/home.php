<?php
require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

// Obtener las películas de la base de datos
$buscar = isset($_GET['buscar']) ? $_GET['buscar'] : '';

// Si hay un término de búsqueda, filtrar las películas
if ($buscar) {
    $sql = 'SELECT * FROM pelicula WHERE nombre LIKE :buscar';
    $stmt = $conn->prepare($sql);
    $stmt->execute(['buscar' => '%' . $buscar . '%']);
    $movies = $stmt->fetchAll();
} else {
    $sql = 'SELECT * FROM pelicula';
    $stmt = $conn->query($sql);
    $movies = $stmt->fetchAll();
}

$sql = 'SELECT * FROM plataforma_de_streaming';
$stmt = $conn->query($sql);
$platforms = $stmt->fetchAll();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <link rel="stylesheet" href="assets/css/home.css">
    <link rel="icon" href="imagenes/Logo.png">
</head>
<body> 
    <header>
        <a href="home.php"><h1>Tiempo de películas</h1></a>
        <nav>
            <ul>
                <li><a href="#movies">Películas</a></li>
                <li><a href="#streaming">Plataforma de streaming</a></li>
            </ul>
            <div class="registerlogin">
                <a href="login.php">Iniciar sesión</a>
                <a href="register.php">Registrarse</a>
            </div>
        </nav>
        <form method="GET" action="home.php" class="buscar-form">
            <input type="text" name="buscar" placeholder="Buscar pelicula" required class="buscar">
            <button type="submit" class="buscar__bottom">Buscar</button>
        </form>
    </header>

    <main>
        <h2 id="movies">Películas</h2>
        <section class="container_movies">
            <?php if ($movies): ?>
                <?php foreach ($movies as $movie): ?>
                    <div class="movie">
                        <img src="<?= $movie['img_url'] ?>" alt="<?= $movie['nombre'] ?>" width="150px" height="200px">
                        <a href="peliculas/pelicula.php?nombre=<?= urlencode($movie['nombre']) ?>" class="movie-link"><?= htmlspecialchars($movie['nombre']) ?> (<?= $movie['año'] ?>)</a>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>No se encontraron películas.</p>
            <?php endif; ?>
        </section>
        <h2 id="streaming">Plataformas de streaming</h2>
        <section class="container_streaming">
            <div class="plataformas">
                <img src="imagenes/Netflix.png" alt="Netflix" width="200px" height="200px">
                <a href="https://www.netflix.com/" class="plataformas-link" target="_blank">Netflix</a>
            </div>
            <div class="plataformas">
                <img src="imagenes/Disney.png" alt="Disney Plus" width="200px" height="200px">
                <a href="https://www.disneyplus.com/" class="plataformas-link" target="_blank">Disney Plus</a>
            </div>
            <div class="plataformas">
                <img src="imagenes/HBOmax.jpg" alt="HBO" width="200px" height="200px">
                <a href="https://www.max.com/" class="plataformas-link" target="_blank">HBO Max</a>
            </div>
            <div class="plataformas">
                <img src="imagenes/AmazonPrime.jpg" alt="Amazon Prime" width="200px" height="200px">
                <a href="https://www.primevideo.com/" class="plataformas-link" target="_blank">Amazon Prime</a>
            </div>
            <div class="plataformas">
                <img src="imagenes/AppleTV.png" alt="Apple TV" width="200px" height="200px">
                <a href="https://www.apple.com/" class="plataformas-link" target="_blank">Apple TV</a>
            </div>
        </section>
    </main>
</body>
</html>
