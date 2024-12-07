<?php

require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

$id = $_GET['id'];
$sql = 'SELECT * FROM pelicula WHERE idpelicula = ?';
$stmt = $conn->prepare($sql);
$stmt->execute([$id]);
$movie = $stmt->fetch();

header('Content-Type: application/json');
echo json_encode($movie);
?>
