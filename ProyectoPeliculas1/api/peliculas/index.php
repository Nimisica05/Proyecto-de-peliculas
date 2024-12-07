<?php

require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

$sql = 'SELECT * FROM pelicula';
$stmt = $conn->query($sql);
$movies = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($movies);
?>
