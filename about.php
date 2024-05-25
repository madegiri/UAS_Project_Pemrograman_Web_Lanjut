<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Tentang Kami</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<div class="heading">
   <h3>Tentang Kami</h3>
   <p> <a href="home.php">Home</a> / Tentang Kami </p>
</div>

<section class="about">

   <div class="flex">

      <div class="image">
         <img src="images/about-img.jpg" alt="">
      </div>

      <div class="content">
         <h3>Kenapa harus memilih kami?</h3>
         <p>Kami menawarkan lebih dari sekadar buku; kami menyajikan pengalaman literatur yang istimewa. Dengan koleksi yang komprehensif dan beragam, dari karya sastra klasik hingga terbitan terkini, kami berkomitmen untuk memenuhi segala selera pembaca.</p>
         <p>Layanan pelanggan yang ramah, penawaran khusus, dan kemudahan berbelanja online memastikan Anda mendapatkan nilai tambah dari setiap pembelian. Bergabunglah dengan kami untuk menjelajahi dunia pengetahuan dan imajinasi melalui halaman-halaman buku yang tak terhitung jumlahnya.</p>
      </div>

   </div>

</section>


<?php include 'footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>