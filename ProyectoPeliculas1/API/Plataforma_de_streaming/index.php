<?php
require 'database.php';

$sql = 'SELECT * FROM plataforma_de_streaming';
$stmt = $pdo->query($sql);
$platforms = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($platforms);
?>
