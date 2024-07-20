<?php
require 'database.php';

$sql = 'SELECT * FROM pelicula';
$stmt = $pdo->query($sql);
$movies = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($movies);
?>
