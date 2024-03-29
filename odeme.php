<?php include'header.php' ?>
	<div class="container">
		
		<div class="clearfix"></div>
		<div class="lines"></div>
	</div>
	
	<div class="container">
		<div class="row">
			
		</div>
		<div class="title-bg">
			<div class="title">Ödeme Sayfası</div>
		</div>
		
		<div class="table-responsive">
			<table class="table table-bordered chart">
				<thead>
					<tr>
						
						<th>Ürün Resim</th>
						<th>Ürün Ad</th>
						<th>Ürün Kodu</th>
						<th>Adet</th>
						<th>Toplam Fiyat</th>			
					</tr>
				</thead>

				<form action="nedmin/netting/islem.php" method="POST">
				<tbody>
				
					<?php 
						$kullanici_id=$kullanicicek['kullanici_id'];
						$sepetsor=$db->prepare("SELECT * from sepet where kullanici_id=:id");
						$sepetsor->execute(array(
							'id' => $kullanici_id
						));
						$toplam_fiyat=0;
						while($sepetcek=$sepetsor->fetch(PDO::FETCH_ASSOC)){
							$urun_id=$sepetcek['urun_id'];
							$urunsor=$db->prepare("SELECT * from urun where urun_id=:urun_id");
							$urunsor->execute(array(
								'urun_id' => $urun_id
							));
							$uruncek=$urunsor->fetch(PDO::FETCH_ASSOC);
							$toplam_fiyat+=$uruncek['urun_fiyat']*$sepetcek['urun_adet'];
						
					 ?>
					
					
					<tr>
						
						<td><img src="images\demo-img.jpg" width="100" alt=""></td>
						<td><?php echo $uruncek['urun_ad'] ?></td>
						<td><?php echo $uruncek['urun_id'] ?></td>
						<td><?php echo $sepetcek['urun_adet'] ?></td>
						<td><?php echo $uruncek['urun_fiyat']  ?>TL</td>
						
					</tr>
					<?php  	} ?>

				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-md-6">
				
				
			</div>
			<div class="col-md-3 col-md-offset-3">
			<div class="subtotal-wrap">
				<!--
				<div class="subtotal">
					<p>Sub Total : $26.00</p>
					<p>Vat 17% : $54.00</p>
				</div>
			-->
				<div class="total">Toplam Tutar: <span class="bigprice"><?php 
				echo "$toplam_fiyat" ?></span></div>
				
				<div class="clearfix"></div>
				<a href="" class="btn btn-default btn-yellow">Ödeme Sayfası</a>
			</div>
			<div class="clearfix"></div>
			</div>
		</div>

					<div class="tab-review">
					<ul	id="myTab" class="nav nav-tabs shop-tab">
						<li class="active" ><a  href="#desc" data-toggle="tab">Kredi Kartı</a></li>
						<li><a href="#rev" data-toggle="tab">Banka Havalesi</a></li>

					</ul>

					<div id="myTabContent" class="tab-content shop-tab-ct">

						<div class="tab-pane fade active in" id="desc">
							<p>
								Entegrasyon Tamamlandi
							</p>
						</div>


						<div class="tab-pane fade" id="rev">
							 <p>Ödeme Yapacağınız Hesap Numarasını Seçerek İşlemi Tamamlayınız.</p>		
							
							<?php 

							$bankasor=$db->prepare("SELECT * from banka order by banka_id asc");
							$bankasor->execute();

							while($bankacek=$bankasor->fetch(PDO::FETCH_ASSOC)){ ?>

							 <input type="radio" name="siparis_banka" value="<?php echo $bankacek['banka_ad'] ?>">

							 <?php echo $bankacek['banka_ad']; echo " "; echo $bankacek['banka_iban']; ?><br>

							<?php  } ?>

							

							<input type="hidden" name="kullanici_id" value="<?php echo $kullanicicek['kullanici_id'] ?>">
							<input type="hidden" name="siparis_toplam" value="<?php echo $toplam_fiyat ?>">

							<button class="btn btn-success" type="submit" name="bankasiparisekle">Sipariş Ver</button>

							</form>

						</div>

					</div>
				</div>
		<div class="spacer"></div>
	</div>
	
	<?php include'footer.php' ?>