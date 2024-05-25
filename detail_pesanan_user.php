<?php
include 'config.php';

if (isset($_GET['id'])) {
   $order_id = $_GET['id'];

   // Query untuk mendapatkan detail pesanan berdasarkan ID
   $query = "SELECT * FROM `orders` WHERE id = $order_id";
   $result = mysqli_query($conn, $query);

   if ($result && mysqli_num_rows($result) > 0) {
      $order_details = mysqli_fetch_assoc($result);
   } else {
      echo "Pesanan tidak ditemukan.";
      exit();
   }
} else {
   echo "Parameter ID pesanan tidak diberikan.";
   exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Pesanan</title>

     <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom admin css file link  -->
   <link rel="stylesheet" href="css/admin_style.css">
</head>
<body>
   
   <section class="order-details">
      <div class="box">
         <h2>Detail Pesanan #<?php echo $order_details['id']; ?></h2>
         <p>Nama Pemesan: <?php echo $order_details['name']; ?></p>
         <p>No Telepon: <?php echo $order_details['number']; ?></p>
         <p>Email: <?php echo $order_details['email']; ?></p>
         <p> Alamat : <span><?php echo $order_details['address']; ?></span> </p>
         <p> Produk : <span><?php echo $order_details['total_products']; ?></span> </p>
         <p> Total Harga : <span>Rp<?php echo number_format($order_details['total_price'], 0, ',', '.'); ?></span> </p>
         <p> Metode Pembayaran : <span><?php echo $order_details['method']; ?></span> </p>
         <p> Metode Pembayaran : <?php echo $order_details['payment_status']; ?> </p>
         
         <a href="orders.php" class="back-btn">Kembali</a>
      </div>
   </section>

</body>
</html>