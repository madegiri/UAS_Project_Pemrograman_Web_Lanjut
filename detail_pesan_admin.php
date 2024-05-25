<?php
include 'config.php';

if (isset($_GET['id'])) {
    $message_id = $_GET['id'];

    $query = "SELECT * FROM `message` WHERE id = $message_id";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $message_details = mysqli_fetch_assoc($result);
    } else {
        echo "Pesan tidak ditemukan.";
        exit();
    }
} else {
    echo "Parameter ID pesan tidak diberikan.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Pesan</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link rel="stylesheet" href="css/admin_style.css">
</head>
<body>
    <?php include 'admin_header.php'; ?>

    <section class="message-details">
        <div class="box">
            <h2>Detail Pesan #<?php echo $message_details['id']; ?></h2>
            <p>ID User: <?php echo $message_details['user_id']; ?></p>
            <p>Nama User: <?php echo $message_details['name']; ?></p>
            <p>No Telepon: <?php echo $message_details['number']; ?></p>
            <p>Email: <?php echo $message_details['email']; ?></p>
            <p>Pesan: <?php echo $message_details['message']; ?></p>

            <a href="admin_contacts.php" class="back-btn">Kembali Ke Daftar Pesan</a>
        </div>
    </section>
</body>
</html>
