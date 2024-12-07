<?php
$server = 'localhost';
$username = 'root';
$password = 'nimisica123';
$database = 'proyectopeliculas';

try {
    $conn = new PDO("mysql:host=$server;dbname=$database;charset=utf8", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Connection Failed: ' . $e->getMessage());
}
?>
