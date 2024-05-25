<?php

include 'config.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:login.php');
};

$items_per_page = 6;

$total_products_query = mysqli_query($conn, "SELECT COUNT(*) as total FROM products") or die('query failed');
$total_products = mysqli_fetch_assoc($total_products_query)['total'];

$total_pages = ceil($total_products / $items_per_page);

$current_page = isset($_GET['page']) ? $_GET['page'] : 1;

$offset = ($current_page - 1) * $items_per_page;

if(isset($_POST['add_product'])){

   $name = mysqli_real_escape_string($conn, $_POST['name']);
   $price = mysqli_real_escape_string($conn, $_POST['price']);
   $image = $_FILES['image']['name'];
   $image_size = $_FILES['image']['size'];
   $image_tmp_name = $_FILES['image']['tmp_name'];
   $image_folder = 'uploaded_img/'.$image;
   $nama_penulis = mysqli_real_escape_string($conn, $_POST['nama_penulis']);
   $nama_penerbit = mysqli_real_escape_string($conn, $_POST['nama_penerbit']);
   $bahasa_buku = mysqli_real_escape_string($conn, $_POST['bahasa_buku']);
   $deskripsi_buku = mysqli_real_escape_string($conn, $_POST['deskripsi_buku']);

   $select_product_name = mysqli_query($conn, "SELECT name FROM products WHERE name = '$name'") or die('query failed');

   if(mysqli_num_rows($select_product_name) > 0){
      $message[] = 'Nama Produk Sudah Ditambahkan!';
   }else{
      $add_product_query = mysqli_query($conn, "INSERT INTO products(name, price, image, nama_penulis, nama_penerbit, bahasa_buku, deskripsi_buku) VALUES('$name', '$price', '$image', '$nama_penulis', '$nama_penerbit', '$bahasa_buku', '$deskripsi_buku')") or die('query failed');

      if($add_product_query){
         if($image_size > 2000000){
            $message[] = 'Ukuran Gambar Terlalu Besar';
         }else{
            move_uploaded_file($image_tmp_name, $image_folder);
            $message[] = 'Produk Berhasil Ditambahkan!';
         }
      }else{
         $message[] = 'Produk Tidak Dapat Ditambahkan!';
      }
   }
}

if(isset($_GET['delete'])){
   $delete_id = $_GET['delete'];
   $delete_image_query = mysqli_query($conn, "SELECT image FROM products WHERE id = '$delete_id'") or die('query failed');
   $fetch_delete_image = mysqli_fetch_assoc($delete_image_query);
   unlink('uploaded_img/'.$fetch_delete_image['image']);
   mysqli_query($conn, "DELETE FROM products WHERE id = '$delete_id'") or die('query failed');
   header('location:admin_products.php');
}

if(isset($_POST['update_product'])){

   $update_p_id = $_POST['update_p_id'];
   $update_name = $_POST['update_name'];
   $update_price = $_POST['update_price'];
   $update_nama_penulis = $_POST['update_nama_penulis'];
   $update_nama_penerbit = $_POST['update_nama_penerbit'];
   $update_bahasa_buku = $_POST['update_bahasa_buku'];
   $update_deskripsi_buku = $_POST['update_deskripsi_buku'];

   mysqli_query($conn, "UPDATE products SET name = '$update_name', price = '$update_price', nama_penulis = '$update_nama_penulis', nama_penerbit = '$update_nama_penerbit', bahasa_buku = '$update_bahasa_buku', deskripsi_buku = '$update_deskripsi_buku' WHERE id = '$update_p_id'") or die('query failed');

   $update_image = $_FILES['update_image']['name'];
   $update_image_tmp_name = $_FILES['update_image']['tmp_name'];
   $update_image_size = $_FILES['update_image']['size'];
   $update_folder = 'uploaded_img/'.$update_image;
   $update_old_image = $_POST['update_old_image'];

   if(!empty($update_image)){
      if($update_image_size > 2000000){
         $message[] = 'Ukuran Gambar Terlalu Besar';
      }else{
         mysqli_query($conn, "UPDATE products SET image = '$update_image' WHERE id = '$update_p_id'") or die('query failed');
         move_uploaded_file($update_image_tmp_name, $update_folder);
         unlink('uploaded_img/'.$update_old_image);
      }
   } 

   header('location:admin_products.php');

}

$select_products = mysqli_query($conn, "SELECT * FROM products ORDER BY id DESC LIMIT $items_per_page OFFSET $offset") or die('query failed');
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Daftar Produk</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <link rel="stylesheet" href="css/admin_style.css">

</head>
<body>
   
<?php include 'admin_header.php'; ?>

<section class="add-products">

   <h1 class="title">Penjualan Produk</h1>

   <form action="" method="post" enctype="multipart/form-data">
      <h3>Tambah Produk</h3>
      <div class="flex">
         <input type="text" name="name" class="box" placeholder="Nama Produk" required>
         <input type="number" min="0" name="price" class="box" placeholder="Harga Produk" required>
         <input type="text" name="nama_penulis" class="box" placeholder="Nama Penulis" required>
         <input type="text" name="nama_penerbit" class="box" placeholder="Nama Penerbit" required>
         <input type="text" name="bahasa_buku" class="box" placeholder="Bahasa" required>
         <textarea name="deskripsi_buku" class="box" cols="50" rows="4" placeholder="Deskripsi Buku"></textarea>
         <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box" required>
         <input type="submit" value="Tambah" name="add_product" class="btn">
      </div>
   </form>

</section>

<section class="show-products">

   <div class="box-container">

      <?php
         $select_products = mysqli_query($conn, "SELECT * FROM products ORDER BY id DESC LIMIT $items_per_page OFFSET $offset") or die('query failed');
         if(mysqli_num_rows($select_products) > 0){
            while($fetch_products = mysqli_fetch_assoc($select_products)){
      ?>
      <div class="box">
         <img src="uploaded_img/<?php echo $fetch_products['image']; ?>" alt="">
         <div class="name"><?php echo $fetch_products['name']; ?></div>
         <div class="price">Rp<?php echo number_format($fetch_products['price'], 0, ',', '.'); ?></div>
         <a href="admin_products.php?update=<?php echo $fetch_products['id']; ?>" class="option-btn">Update</a>
         <a href="admin_products.php?delete=<?php echo $fetch_products['id']; ?>" class="delete-btn" onclick="return confirm('Hapus Produk Ini?');">Hapus</a>
         <a href="detail_produk.php?id=<?php echo $fetch_products['id']; ?>&page=<?php echo $current_page; ?>" class="detail-btn">Detail</a>
      </div>
      <?php
         }
      }else{
         echo '<p class="empty">Tidak Ada Produk!</p>';
      }
      ?>
   </div>

</section>

<div class="pagination">
   <?php
   for ($i = 1; $i <= $total_pages; $i++) {
      echo '<a href="admin_products.php?page=' . $i . '"';
      if ($i == $current_page) {
         echo ' class="active"';
      }
      echo '>' . $i . '</a>';
   }
   ?>
</div>

<section class="edit-product-form">

   <?php
      if(isset($_GET['update'])){
         $update_id = $_GET['update'];
         $update_query = mysqli_query($conn, "SELECT * FROM products WHERE id = '$update_id'") or die('query failed');
         if(mysqli_num_rows($update_query) > 0){
            while($fetch_update = mysqli_fetch_assoc($update_query)){
   ?>
   <form action="" method="post" enctype="multipart/form-data">
      <div class="flex">
         <input type="hidden" name="update_p_id" value="<?php echo $fetch_update['id']; ?>">
         <input type="hidden" name="update_old_image" value="<?php echo $fetch_update['image']; ?>">
         <img src="uploaded_img/<?php echo $fetch_update['image']; ?>" alt="">
         <input type="text" name="update_name" value="<?php echo $fetch_update['name']; ?>" class="box" required placeholder="Nama Produk">
         <input type="number" name="update_price" value="<?php echo $fetch_update['price']; ?>" min="0" class="box" required placeholder="Harga Produk">
         <input type="text" name="update_nama_penulis" value="<?php echo $fetch_update['nama_penulis']; ?>" class="box" required placeholder="Nama Penulis">
         <input type="text" name="update_nama_penerbit" value="<?php echo $fetch_update['nama_penerbit']; ?>" class="box" required placeholder="Nama Penerbit">
         <input type="text" name="update_bahasa_buku" value="<?php echo $fetch_update['bahasa_buku']; ?>" class="box" required placeholder="Bahasa Buku">
         <textarea name="update_deskripsi_buku" class="box" cols="50" rows="4" required placeholder="Deskripsi Buku"><?php echo htmlspecialchars($fetch_update['deskripsi_buku']); ?></textarea>
         <input type="file" class="box" name="update_image" accept="image/jpg, image/jpeg, image/png">
         <input type="submit" value="update" name="update_product" class="btn">
         <input type="reset" value="Batal" id="close-update" class="option-btn">
      </div>
   </form>
   <?php
         }
      }
      }else{
         echo '<script>document.querySelector(".edit-product-form").style.display = "none";</script>';
      }
   ?>

</section>

<script src="js/admin_script.js"></script>

</body>
</html>