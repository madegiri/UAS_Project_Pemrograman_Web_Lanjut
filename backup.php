<?php
include 'config.php';

$queryUsers = "SELECT * FROM users";
$resultUsers = mysqli_query($conn, $queryUsers);
$dataUsers = array();

while ($rowUsers = mysqli_fetch_assoc($resultUsers)) {
    $dataUsers[] = $rowUsers;
}

$queryProduct = "SELECT * FROM products";
$resultProduct = mysqli_query($conn, $queryProduct);
$dataProduct = array();

while ($rowProduct = mysqli_fetch_assoc($resultProduct)) {
    $dataProduct[] = $rowProduct;
}

$queryOrder = "SELECT * FROM orders";
$resultOrder = mysqli_query($conn, $queryOrder);
$dataOrder = array();

while ($rowOrder = mysqli_fetch_assoc($resultOrder)) {
    $dataOrder[] = $rowOrder;
}

$backupData = array(
    'users' => $dataUsers,
    'products' => $dataProduct,
    'orders' => $dataOrder
);

$backupJson = json_encode($backupData, JSON_PRETTY_PRINT);

$file = fopen('data_backup.json', 'w');
fwrite($file, $backupJson);
fclose($file);

echo 'Berhasil Backup Data. Data tersimpan di data_backup.json';
?>
