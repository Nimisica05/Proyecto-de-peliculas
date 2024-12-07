<?php

require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

$nombre = $_GET['nombre'] ?? null;

try {
    $sql = '
        SELECT pelicula.*, plataforma_de_streaming.nombre as platform_name 
        FROM pelicula 
        INNER JOIN plataforma_de_streaming_has_pelicula ON pelicula.idpelicula = plataforma_de_streaming_has_pelicula.pelicula_idpelicula 
        INNER JOIN plataforma_de_streaming ON plataforma_de_streaming_has_pelicula.plataforma_de_streaming_idplataforma_de_streaming = plataforma_de_streaming.idplataforma_de_streaming 
        WHERE 1=1';
    $params = [];

    if ($nombre) {
        $sql .= ' AND pelicula.nombre LIKE ?';
        $params[] = "%$nombre%";
    }

    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    $movies = $stmt->fetchAll();

    header('Content-Type: application/json');
    echo json_encode($movies);
} catch (PDOException $e) {
    echo json_encode([
        'error' => true,
        'message' => $e->getMessage()
    ]);
}
?>
