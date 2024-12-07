<?php

require 'C:\xampp\htdocs\ProyectoPeliculas1\database.php';

$id = $_GET['id'];
$sql = 'SELECT * FROM plataforma_de_streaming WHERE idplataforma_de_streaming = ?';
$stmt = $conn->prepare($sql);
$stmt->execute([$id]);
$platform = $stmt->fetch();

header('Content-Type: application/json');
echo json_encode($platform);
?>
