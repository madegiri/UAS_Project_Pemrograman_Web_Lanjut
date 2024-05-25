<?php
include 'config.php';

if (isset($_POST['search'])) {
    $search_item = $_POST['search'];

    if ($search_item === '') {
    } else {
        $select_products = $conn->prepare("SELECT * FROM products WHERE name LIKE ?");

        $search_param = "%$search_item%";
        $select_products->bind_param("s", $search_param);

        $select_products->execute();

        $result = $select_products->get_result();

        if ($result->num_rows > 0) {    
            echo '<section class="products" style="padding-top: 0;">';
            echo '<div id="searchResults"></div>';
            echo '<div class="box-container">';
            
            while ($fetch_product = $result->fetch_assoc()) {
                echo '<form action="search_page.php" method="post" class="box">';
                echo '<img src="uploaded_img/' . $fetch_product['image'] . '" alt="" class="image">';
                echo '<div class="name">' . $fetch_product['name'] . '</div>';
                echo '<div class="price">Rp' . number_format($fetch_product['price'], 0, ',', '.') . '</div>';
                echo '<input type="number" class="qty" name="product_quantity" min="1" value="1">';
                echo '<input type="hidden" name="product_name" value="' . $fetch_product['name'] . '">';
                echo '<input type="hidden" name="product_price" value="' . $fetch_product['price'] . '">';
                echo '<input type="hidden" name="product_image" value="' . $fetch_product['image'] . '">';
                echo '<a href="detail_produk_user.php?id=' . $fetch_product['id'] . '" class="detail-btn">Detail</a>';
                echo '<input type="submit" class="btn" value="Tambah Ke Keranjang" name="add_to_cart">';
                echo '</form>';
            }
            
            echo '</div>';
            echo '</section>';
        } else {
            echo '<p class="empty" style="width: 800px; margin-left: 450px;">Hasil Tidak Ditemukan</p>';
        }

        $select_products->close();
    }
}
?>