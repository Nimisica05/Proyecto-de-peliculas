<?php
require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

$nombrePelicula = isset($_GET['nombre']) ? $_GET['nombre'] : '';


$sql = 'SELECT * FROM pelicula WHERE nombre = :nombre';
$stmt = $conn->prepare($sql);
$stmt->execute(['nombre' => $nombrePelicula]);
$movie = $stmt->fetch();

if (!$movie) {
    die('Película no encontrada.');
}


$sqlDirector = 'SELECT nombre FROM director WHERE iddirector = :id';
$stmtDirector = $conn->prepare($sqlDirector);
$stmtDirector->execute(['id' => $movie['director_iddirector']]);
$director = $stmtDirector->fetchColumn();


$sqlGenero = 'SELECT nombre FROM genero WHERE idgenero = :id';
$stmtGenero = $conn->prepare($sqlGenero);
$stmtGenero->execute(['id' => $movie['genero_idgenero']]);
$genero = $stmtGenero->fetchColumn();


$sqlPlatforms = '
    SELECT ps.nombre AS plataforma
    FROM plataforma_de_streaming AS ps
    JOIN plataforma_de_streaming_has_pelicula AS ps_p ON ps.idplataforma_de_streaming = ps_p.plataforma_de_streaming_idplataforma_de_streaming
    WHERE ps_p.pelicula_idpelicula = :idpelicula';
$stmtPlatforms = $conn->prepare($sqlPlatforms);
$stmtPlatforms->execute(['idpelicula' => $movie['idpelicula']]);
$platforms = $stmtPlatforms->fetchAll();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($movie['nombre']) ?></title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="imagenes/Logo.png">
</head>
<body>  
    <header>
        <h1>Tiempo de películas</h1>
    </header>
    <h2><?= htmlspecialchars($movie['nombre']) ?></h2>
    <div class="container">
        <div class="left"> 
            <img src="<?= htmlspecialchars($movie['img_url']) ?>" alt="<?= htmlspecialchars($movie['nombre']) ?>">
        </div>
        <div class="right">
            <h2>Detalles</h2>
            <h3>Director: <p><?= htmlspecialchars($director) ?></p></h3>
            <h3>Género: <p><?= htmlspecialchars($genero) ?></p></h3>
            <h3>Duración: <p><?= htmlspecialchars($movie['duracion']) ?></p></h3>
            <h3>Año: <p><?= htmlspecialchars($movie['año']) ?></p></h3>
            <h3>Plataformas disponibles:</h3>
            <ul>
                <?php foreach ($platforms as $platform): ?>
                    <li><?= htmlspecialchars($platform['plataforma']) ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</body>
</html>
