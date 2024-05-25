<?php
include 'config.php';
session_start();

if(isset($_POST['submit'])){
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   $password = mysqli_real_escape_string($conn, md5($_POST['password']));
   $user_captcha = mysqli_real_escape_string($conn, $_POST['captcha']);

   $correct_captcha = $_SESSION["code"];

   if (empty($user_captcha) || $user_captcha !== $correct_captcha) {
      $message[] = 'Kode CAPTCHA Salah!';
   } else {
      $select_users = mysqli_query($conn, "SELECT * FROM `users` WHERE email = '$email' AND password = '$password'") or die('query failed');

      if(mysqli_num_rows($select_users) > 0){
         $row = mysqli_fetch_assoc($select_users);

         if($row['user_type'] == 'admin'){
            $_SESSION['admin_name'] = $row['name'];
            $_SESSION['admin_email'] = $row['email'];
            $_SESSION['admin_id'] = $row['id'];
            header('location:admin_page.php');
         } elseif($row['user_type'] == 'user'){
            $_SESSION['user_name'] = $row['name'];
            $_SESSION['user_email'] = $row['email'];
            $_SESSION['user_id'] = $row['id'];
            header('location:home.php');
         }
      } else {
         $message[] = 'Email atau Password Salah!';
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
   <title>Login</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

   <link rel="stylesheet" href="css/style.css">

</head>
<body>

<?php
if(isset($message)){
   foreach($message as $message){
      echo '
      <div class="message">
         <span>'.$message.'</span>
         <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
      </div>
      ';
   }
}
?>
   
<div class="form-container">

   <form action="" method="post">
      <h3>login</h3>
      <input type="email" name="email" placeholder="Masukkan Email" required class="box">
      <input type="password" name="password" placeholder="Masukkan Password" required class="box">
      <div class="input-group">
         <input type="text" id="captcha" name="captcha" class="box" placeholder="Masukkan Kode Captcha" required>
         <img src="captcha.php" alt="Captcha Image" class="img-fluid mx-2 captcha-img">
      </div>
      
      <input type="submit" name="submit" value="login" class="btn">
      <p>Belum punya akun? <a href="register.php">Register</a></p>
   </form>

</div>

</body>
</html>