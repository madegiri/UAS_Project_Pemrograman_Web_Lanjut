<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];
$user_info_query = mysqli_query($conn, "SELECT name, email FROM `users` WHERE id = '$user_id'") or die('query failed');
$user_info = mysqli_fetch_assoc($user_info_query);

if(!isset($user_id)){
   header('location:login.php');
}

if(isset($_POST['order_btn'])){

   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $number = $_POST['number'];
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   $method = mysqli_real_escape_string($conn, $_POST['method']);
   $address = mysqli_real_escape_string($conn, 'flat no. '. $_POST['flat'].', '. $_POST['street'].', '. $_POST['city'].', '. $_POST['country'].' - '. $_POST['pin_code']);
   $placed_on = date('d-M-Y');

   $cart_total = 0;
   $cart_products[] = '';

   $cart_query = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
   if(mysqli_num_rows($cart_query) > 0){
      while($cart_item = mysqli_fetch_assoc($cart_query)){
         $cart_products[] = $cart_item['name'].' ('.$cart_item['quantity'].') ';
         $sub_total = ($cart_item['price'] * $cart_item['quantity']);
         $cart_total += $sub_total;
      }
   }

   $total_products = implode(', ',$cart_products);

   $order_query = mysqli_query($conn, "SELECT * FROM `orders` WHERE name = '$name' AND number = '$number' AND email = '$email' AND method = '$method' AND address = '$address' AND total_products = '$total_products' AND total_price = '$cart_total'") or die('query failed');

   if($cart_total == 0){
      $message[] = 'Keranjang Kamu Kosong!';
   }else{
      if(mysqli_num_rows($order_query) > 0){
         $message[] = 'Order Sudah Ada!'; 
      }else{
         mysqli_query($conn, "INSERT INTO `orders`(user_id, name, number, email, method, address, total_products, total_price, placed_on) VALUES('$user_id', '$name', '$number', '$email', '$method', '$address', '$total_products', '$cart_total', '$placed_on')") or die('query failed');
         $message[] = 'Order Berhasil';
         mysqli_query($conn, "DELETE FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
      }
   }
   
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Checkout</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<div class="heading">
   <h3>checkout</h3>
   <p> <a href="home.php">Home</a> / Checkout </p>
</div>

<section class="display-order">

   <?php  
      $grand_total = 0;
      $select_cart = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
      if(mysqli_num_rows($select_cart) > 0){
         while($fetch_cart = mysqli_fetch_assoc($select_cart)){
            $total_price = ($fetch_cart['price'] * $fetch_cart['quantity']);
            $grand_total += $total_price;
   ?>
   <p> <?php echo $fetch_cart['name']; ?> <span>(<?php echo 'Rp'.number_format($fetch_cart['price'], 0, ',', '.').' x '. $fetch_cart['quantity']; ?>)</span> </p>
   <?php
      }
   }else{
      echo '<p class="empty">Keranjang Kamu Kosong!</p>';
   }
   ?>
   <div class="grand-total"> Total Harga : <span>Rp<?php echo number_format($grand_total, 0, ',', '.'); ?></span> </div>

</section>

<section class="checkout">

   <form action="" method="post">
      <h3>Lengkapi Data Pesanan</h3>
      <div class="flex">
         <div class="inputBox">
            <span>Nama :</span>
            <input type="text" name="name" required placeholder="Nama" value="<?php echo isset($user_info['name']) ? $user_info['name'] : ''; ?>">
         </div>
         <div class="inputBox">
            <span>No Telepon :</span>
            <input type="number" name="number" required placeholder="No Telepon">
         </div>
         <div class="inputBox">
            <span>Email :</span>
            <input type="email" name="email" required placeholder="Email" value="<?php echo isset($user_info['email']) ? $user_info['email'] : ''; ?>">
         </div>
         <div class="inputBox">
            <span>Metode Pembayaran :</span>
            <select name="method">
               <option value="Transfer Bank">Transfer Bank</option>
               <option value="COD">COD</option>
            </select>
         </div>
         <div class="inputBox">
            <span>No Rumah/Kantor :</span>
            <input type="number" min="0" name="flat" required placeholder="No Rumah/Kantor">
         </div>
         <div class="inputBox">
            <span>Alamat :</span>
            <input type="text" name="street" required placeholder="Alamat">
         </div>
         <div class="inputBox">
            <span>Kota :</span>
            <input type="text" name="city" required placeholder="Kota">
         </div>
         <div class="inputBox">
            <span>Provinsi :</span>
            <input type="text" name="state" required placeholder="Provinsi">
         </div>
         <div class="inputBox">
            <span>Negara :</span>
            <input type="text" name="country" required placeholder="Negara">
         </div>
         <div class="inputBox">
            <span>Kode Pos :</span>
            <input type="number" min="0" name="pin_code" required placeholder="Kode Pos">
         </div>
      </div>
      <input type="submit" value="Order Sekarang" class="btn" name="order_btn">
   </form>

</section>









<?php include 'footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>