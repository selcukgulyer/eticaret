<?php 
include 'header.php';
ob_start();
session_start();



 
  $kullanicisor=$db->prepare("SELECT * from kullanici where kullanici_mail=:mail" );
  if (isset($_SESSION['userkullanici_mail'])) {
    $kullanicisor->execute(array
    (
      'mail' => $_SESSION['userkullanici_mail']
    ));
      $say=$kullanicisor->rowCount();
  $kullanicicek=$kullanicisor->fetch(PDO::FETCH_ASSOC
  }

);

 ?>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="page-title-wrap">
				<div class="page-title-inner">
					<div class="row">
						<div class="col-md-12">
							<div class="bigtitle">Kullanıcı Kaydı</div>
							<p >Kullanıcı bilgilerini aşağıdaki form aracılığı ile güncelleyebilirsiniz.</p>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<form action="nedmin/netting/islem.php" method="POST" class="form-horizontal checkout" role="form">
		<div class="row">
			<div class="col-md-6">
				<div class="title-bg">
					<div class="title">Kayıt Bilgileri</div>
				</div>

				<?php 
				if (isset($_GET['durum'])) {
				if ($_GET['durum']=="farklisifre") {?>

				<div class="alert alert-danger">
					<strong>Hata!</strong> Girdiğiniz şifreler eşleşmiyor.
				</div>
					
				<?php } elseif ($_GET['durum']=="eksiksifre") {?>

				<div class="alert alert-danger">
					<strong>Hata!</strong> Şifreniz minimum 6 karakter uzunluğunda olmalıdır.
				</div>
					
				<?php } elseif ($_GET['durum']=="mukerrerkayit") {?>

				<div class="alert alert-danger">
					<strong>Hata!</strong> Bu kullanıcı daha önce kayıt edilmiş.
				</div>
					
				<?php } elseif ($_GET['durum']=="basarisiz") {?>

				<div class="alert alert-danger">
					<strong>Hata!</strong> Kayıt Yapılamadı Sistem Yöneticisine Danışınız.
				</div>
					
				<?php
				}

 				}
				 ?>


				


				<div class="form-group dob">
					<div class="col-sm-12">
						
						<input type="text" class="form-control"  required="required" disabled="" name="kullanici_adsoyad" value="<?php echo $kullanicicek['kullanici_adsoyad'] ?>"> 
					</div>		
				</div>

				<div class="form-group dob">
					<div class="col-sm-12">
						
						<input type="text" class="form-control"  required="required" name="kullanici_gsm" value="<?php echo $kullanicicek['kullanici_gsm'] ?>">
					</div>
					
				</div>
				<div class="form-group dob">
					<div class="col-sm-12">
						
						<input type="text" class="form-control"  required="" name="kullanici_tc" value=" <?php echo $kullanicicek['kullanici_tc'] ?>">
					</div>		
				</div>

				<div class="form-group">
					<div class="col-sm-12">
						<input type="email" class="form-control" required="" name="kullanici_mail" value=" <?php echo $kullanicicek['kullanici_mail'] ?>">
					</div>
				</div>
				<div class="form-group dob">
					<div class="col-sm-6">
						<input type="password" class="form-control" name="kullanici_passwordone"   value="<?php echo $kullanicicek['kullanici_password'] ?>">
					</div>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="kullanici_passwordtwo"  value="<?php echo $kullanicicek['kullanici_password'] ?>">
					</div>
				</div>



				<button type="submit" name="kullaniciguncelle" class="btn btn-default btn-red">Bilgilerimi Güncelle</button>
			</div>
			<div class="col-md-6">
				<div class="title-bg">
					<div class="title">Şifrenizi mi Unuttunuz?</div>
				</div>


				<center><img width="400" src="http://www.emrahyuksel.com.tr/dimg/sifremi-unuttum.jpg"></center>
			</div>
		</div>
		</form>
	</div>
	

<div class="spacer"></div>
</div>

<?php include 'footer.php'; ?>