<?php
include 'config.php';

if(isset($_GET['id'])) {
    $product_id = $_GET['id'];
    
    $select_product_query = mysqli_query($conn, "SELECT * FROM products WHERE id = '$product_id'");
    
    if(mysqli_num_rows($select_product_query) > 0) {
        $product = mysqli_fetch_assoc($select_product_query);
    } else {
        echo "Produk tidak ditemukan.";
        exit();
    }
} else {
    echo "ID Produk tidak valid.";
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Produk - <?php echo $product['name']; ?></title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <!-- custom admin css file link  -->
    <link rel="stylesheet" href="css/admin_style.css">
</head>
<body>


<!-- Detail produk section starts  -->
<section class="detail-container">
    <h1 class="title">Detail Produk</h1>
    
    <img src="uploaded_img/<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="height: 450px;">

    <div class="info">
        <p><strong>Nama Produk:</strong> <?php echo $product['name']; ?></p>
        <p><strong>Harga:</strong> Rp<?php echo number_format($product['price'], 0, ',', '.'); ?></p>
        <p><strong>Nama Penulis:</strong> <?php echo $product['nama_penulis']; ?></p>
        <p><strong>Nama Penerbit:</strong> <?php echo $product['nama_penerbit']; ?></p>
        <p><strong>Bahasa Buku:</strong> <?php echo $product['bahasa_buku']; ?></p>
        <p><strong>Deskripsi Buku:</strong> <?php echo $product['deskripsi_buku']; ?></p>

        <?php 
            $return_page = isset($_GET['page']) ? $_GET['page'] : '1';
            echo '<a class="back-btn" href="shop.php?page=' . $return_page . '">Kembali Ke Daftar Produk</a>';
        ?>
    </div>
</section>
<!-- Detail produk section ends -->

<!-- custom admin js file link  -->
<script src="js/admin_script.js"></script>

</body>
</html>