<?php
require 'database.php';

$id = $_GET['id'];
$sql = 'SELECT * FROM plataforma_de_streaming WHERE id = ?';
$stmt = $pdo->prepare($sql);
$stmt->execute([$id]);
$platform = $stmt->fetch();

header('Content-Type: application/json');
echo json_encode($platform);
?>
