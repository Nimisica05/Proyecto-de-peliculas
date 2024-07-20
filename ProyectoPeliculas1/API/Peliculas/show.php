<?php
require 'database.php';

$id = $_GET['id'];
$sql = 'SELECT * FROM pelicula WHERE id = ?';
$stmt = $pdo->prepare($sql);
$stmt->execute([$id]);
$movie = $stmt->fetch();

header('Content-Type: application/json');
echo json_encode($movie);
?>
