<?php
require 'database.php';

$genero = $_GET['genero'] ?? null;
$director = $_GET['director'] ?? null;

$sql = 'SELECT * FROM pelicula WHERE 1=1';
$params = [];

if ($genero) {
    $sql .= ' AND genero = ?';
    $params[] = $genero;
}

if ($director) {
    $sql .= ' AND cast LIKE ?';
    $params[] = "%$director%";
}

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$movies = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($movies);
?>
