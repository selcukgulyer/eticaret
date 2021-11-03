<?php 
ob_start();
session_start();
error_reporting(E_ALL & ~E_NOTICE);

include 'baglan.php';
include '../production/fonksiyon.php';

if (isset($_POST['admingiris'])) {
	$kullanici_mail=$_POST['kullanici_mail'];
	$kullanici_password=$_POST['kullanici_password'];

	$kullanicisor=$db->prepare("SELECT * FROM kullanici where kullanici_mail=:mail and kullanici_password=:password and kullanici_yetki=:yetki");
	$kullanicisor->execute(array(
		'mail' => $kullanici_mail,
		'password' => $kullanici_password,
		'yetki' => 5
	));
	echo $say=$kullanicisor->rowCount();
	
	if ($say==1) {
		$_SESSION['kullanici_mail']=$kullanici_mail;
		header("Location:../production/index.php");
		exit;
	}
	else{
		header("Location:../production/login.php?durum=no");
	}

}


if (isset($_POST['kullanici_giris'])) {
	$kullanici_mail=htmlspecialchars($_POST['kullanici_mail']);
	$kullanici_password=$_POST['kullanici_password'];

	$kullanicisor=$db->prepare("SELECT * FROM kullanici where kullanici_mail=:mail and kullanici_password=:password and kullanici_yetki=:yetki and kullanici_durum=:durum");
	$kullanicisor->execute(array(
		'mail' => $kullanici_mail,
		'password' => $kullanici_password,
		'yetki' => 1,
		'durum'=>1
	));
	 $say=$kullanicisor->rowCount();
	
	
	if ($say==1) {
		$_SESSION['userkullanici_mail']=$kullanici_mail;
		header("Location:../../");
		exit;
	}
	else{
		header("Location:../../?durum=basarisiz");
	}

}

if (isset($_POST['kullanicikaydet'])) {
	 $kullanici_adsoyad=htmlspecialchars($_POST['kullanici_adsoyad']);
	  $kullanici_mail=htmlspecialchars($_POST['kullanici_mail']);

	 $kullanici_passwordone=htmlspecialchars($_POST['kullanici_passwordone']);
	 $kullanici_passwordtwo=htmlspecialchars($_POST['kullanici_passwordtwo']);
	
	if ($kullanici_passwordone==$kullanici_passwordtwo) {

		if (strlen($kullanici_passwordone)>=6) {

			$kullanicisor=$db->prepare("SELECT * from kullanici where kullanici_mail=:mail");
			$kullanicisor->execute(array(
				'mail' => $kullanici_mail
			));

			$say=$kullanicisor->rowCount();

			if ($say==0) {
				$password=$kullanici_passwordone;
				$kullanici_yetki=1;


				$kullanicikaydet=$db->prepare("INSERT INTO kullanici set

					kullanici_adsoyad=:kullanici_adsoyad,
					kullanici_mail=:kullanici_mail,
					kullanici_password=:kullanici_password,
					kullanici_yetki=:kullanici_yetki

					");

				$insert=$kullanicikaydet->execute(array(

					'kullanici_adsoyad'=>$kullanici_adsoyad,
					'kullanici_mail'=> $kullanici_mail,
					'kullanici_password'=>$password,
					'kullanici_yetki'=>$kullanici_yetki
				));

				if ($insert) {
					header("Location:../../index.php?durum=loginbasarili");
				}
				else{
					header("Location:../../register.php?durum=basarisiz");
				}

			}
			else{
				header("Location:../../register.php?durum=mukerrerkayit");
			}

			
	
			
		}
		else{

		header("Location:../../register.php?durum=eksiksifre");
		}
		
	}

	else{

		header("Location:../../register.php?durum=farklisifre");
	}
}


	


if (isset($_POST['logoduzenle'])) {

	if ($_FILES['ayar_logo']['size']>1048576) {
		echo "bu dosya boyutu çok büyük";

		Header("Location:../production/genel-ayar.php?durum=dosyabuyuk");
	}

	$izinliuzantılar=array('jpg','gif','png');

	//echo $_FILES['ayar_logo']["name"];

	$ext=strtolower(substr($_FILES['ayar_logo']["name"],strpos($_FILES['ayar_logo']["name"],'.')+1));

	if (in_array($ext, $izinliuzantılar)===false) {
		echo "Bu Uzantı Kabul Edilmiyor";
		Header("Location:../production/genel-ayar.php?durum=formathata");

		exit;
	}

	$uploads_dir = '../../dimg';

	@$tmp_name = $_FILES['ayar_logo']["tmp_name"];
	@$name = $_FILES['ayar_logo']["name"];

	$benzersizsayi4=rand(20000,32000);
	$refimgyol=substr($uploads_dir, 6)."/".$benzersizsayi4.$name;

	@move_uploaded_file($tmp_name, "$uploads_dir/$benzersizsayi4$name");

	
	$duzenle=$db->prepare("UPDATE ayar SET
		ayar_logo=:logo
		WHERE ayar_id=0");
	$update=$duzenle->execute(array(
		'logo' => $refimgyol
		));



	if ($update) {

		$resimsilunlink=$_POST['eski_yol'];
		unlink("../../$resimsilunlink");

		Header("Location:../production/genel-ayar.php?durum=ok");

	} else {

		Header("Location:../production/genel-ayar.php?durum=no");
	}

}



if (isset($_POST['sliderkaydet'])) {
	$uploads_dir='../../dimg/slider';
	@$tmp_name = $_FILES['slider_resimyol']["tmp_name"];
	@$name = $_FILES['slider_resimyol']["name"];

	$benzersizsayi1=rand(20000,32000);
	$benzersizsayi2=rand(20000,32000);
	$benzersizsayi3=rand(20000,32000);
	$benzersizsayi4=rand(20000,32000);
	$benzersizad=$benzersizsayi1.$benzersizsayi2.$benzersizsayi3.$benzersizsayi4;
	$refimgyol=substr($uploads_dir, 6)."/".$benzersizad.$name;

	@move_uploaded_file($tmp_name, "$uploads_dir/$benzersizad$name");



	$kaydet=$db->prepare("INSERT INTO slider set

		slider_ad=:slider_ad,
		slider_sira=:slider_sira,
		slider_link=:slider_link,
		slider_resimyol=:slider_resimyol
		");

	$insert=$kaydet->execute(array(

		'slider_ad'=> $_POST['slider_ad'],
		'slider_sira'=> $_POST['slider_sira'],
		'slider_link'=> $_POST['slider_link'],
		'slider_resimyol'=> $refimgyol
		));
	if ($insert) {
		header("Location:../production/slider.php?durum=ok");
	}

	else{
		header("Location:../production/slider.php?durum=no");
	}

}

if (isset($_POST['genelayarkaydet'])) {

	$ayarkaydet=$db->prepare("UPDATE ayar SET
		ayar_title=:ayar_title,
		ayar_description=:ayar_description,
		ayar_keywords=:ayar_keywords,
		ayar_author=:ayar_author
		WHERE ayar_id=0");

	$update=$ayarkaydet->execute(array(
		'ayar_title' => $_POST['ayar_title'],
		'ayar_description' => $_POST['ayar_description'],
		'ayar_keywords' => $_POST['ayar_keywords'],
		'ayar_author' => $_POST['ayar_author']

	));
	if ($update) {
		header("Location:../production/genel-ayar.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/genel-ayar.php?durum=no");
	}
}


if (isset($_POST['iletisimayarkaydet'])) {

	$ayarkaydet=$db->prepare("UPDATE ayar SET
		ayar_tel=:ayar_tel,
		ayar_gsm=:ayar_gsm,
		ayar_faks=:ayar_faks,
		ayar_mail=:ayar_mail,
		ayar_ilce=:ayar_ilce,
		ayar_il=:ayar_il,
		ayar_adress=:ayar_adress,
		ayar_mesai=:ayar_mesai
		
		WHERE ayar_id=0");

	$update=$ayarkaydet->execute(array(
		'ayar_tel' => $_POST['ayar_tel'],
		'ayar_gsm' => $_POST['ayar_gsm'],
		'ayar_faks' => $_POST['ayar_faks'],
		'ayar_mail' => $_POST['ayar_mail'],
		'ayar_ilce' => $_POST['ayar_ilce'],
		'ayar_il' => $_POST['ayar_il'],
		'ayar_adress' => $_POST['ayar_adress'],
		'ayar_mesai' => $_POST['ayar_mesai']

	));
	if ($update) {
		header("Location:../production/iletisim-ayarlar.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/iletisim-ayarlar.php?durum=no");
	}
}


if (isset($_POST['apiayarlarkaydet'])) {

	$ayarkaydet=$db->prepare("UPDATE ayar SET
		ayar_maps=:ayar_maps,
		ayar_analystic=:ayar_analystic,
		ayar_zopim=:ayar_zopim
		WHERE ayar_id=0");

	$update=$ayarkaydet->execute(array(
		'ayar_maps' => $_POST['ayar_maps'],
		'ayar_analystic' => $_POST['ayar_analystic'],
		'ayar_zopim' => $_POST['ayar_zopim']

	));
	if ($update) {
		header("Location:../production/api-ayarlar.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/api-ayarlar.php?durum=no");
	}
}


if (isset($_POST['sosyalayarlarkaydet'])) {

	$ayarkaydet=$db->prepare("UPDATE ayar SET
		ayar_facebook=:ayar_facebook,
		ayar_twitter=:ayar_twitter,
		ayar_youtube=:ayar_youtube,
		ayar_google=:ayar_google
		WHERE ayar_id=0");

	$update=$ayarkaydet->execute(array(
		'ayar_facebook' => $_POST['ayar_facebook'],
		'ayar_twitter' => $_POST['ayar_twitter'],
		'ayar_youtube' => $_POST['ayar_youtube'],
		'ayar_google' => $_POST['ayar_google']

	));
	if ($update) {
		header("Location:../production/sosyal-ayarlar.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/sosyal-ayarlar.php?durum=no");
	}
}

if (isset($_POST['mailayarlarkaydet'])) {

	$ayarkaydet=$db->prepare("UPDATE ayar SET
		ayar_smtphost=:ayar_smtphost,
		ayar_smtpuser=:ayar_smtpuser,
		ayar_smtppassword=:ayar_smtppassword,
		ayar_smtpport=:ayar_smtpport
		WHERE ayar_id=0");

	$update=$ayarkaydet->execute(array(
		'ayar_smtphost' => $_POST['ayar_smtphost'],
		'ayar_smtpuser' => $_POST['ayar_smtpuser'],
		'ayar_smtppassword' => $_POST['ayar_smtppassword'],
		'ayar_smtpport' => $_POST['ayar_smtpport']

	));
	if ($update) {
		header("Location:../production/mail-ayarlar.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/mail-ayarlar.php?durum=no");
	}
}


if (isset($_POST['hakkimizdaayarkaydet'])) {

	$ayarkaydet=$db->prepare("UPDATE hakkimizda SET
		hakkimizda_baslik=:hakkimizda_baslik,
		hakkimizda_icerik=:hakkimizda_icerik,
		hakkimizda_video=:hakkimizda_video,
		hakkimizda_vizyon=:hakkimizda_vizyon,
		hakkimizda_misyon=:hakkimizda_misyon
		WHERE hakkimizda_id=0");

	$update=$ayarkaydet->execute(array(
		'hakkimizda_baslik' => $_POST['hakkimizda_baslik'],
		'hakkimizda_icerik' => $_POST['hakkimizda_icerik'],
		'hakkimizda_video' => $_POST['hakkimizda_video'],
		'hakkimizda_vizyon' => $_POST['hakkimizda_vizyon'],
		'hakkimizda_misyon' => $_POST['hakkimizda_misyon']

	));
	if ($update) {
		header("Location:../production/hakkimizda.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/hakkimizda.php?durum=no");
	}
}

if (isset($_POST['kullaniciduzenle'])) {

	$kullanici_id=$_POST['kullanici_id'];


	$ayarkaydet=$db->prepare("UPDATE kullanici SET 
		kullanici_tc=:kullanici_tc,
		kullanici_adsoyad=:kullanici_adsoyad,
		kullanici_durum=:kullanici_durum
		where kullanici_id={$_POST['kullanici_id']}");

	$update=$ayarkaydet->execute(array(
		'kullanici_tc'=> $_POST['kullanici_tc'],
		'kullanici_adsoyad'=> $_POST['kullanici_adsoyad'],
		'kullanici_durum'=> $_POST['kullanici_durum']

	));

	if ($update) {
		header("Location:../production/kullanici-duzenle.php?kullanici_id=$kullanici_id&durum=ok");
	}
	else
	{
		
		header("Location:../production/kullanici-duzenle.php?kullanici_id=$kullanici_id&durum=no");
	}
}


if ($_GET['kullanicisil']=="ok") {
	
	$sil=$db->prepare("DELETE from kullanici where kullanici_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['kullanici_id']
	));

	if ($kontrol) {
		header("Location:../production/kullanici.php?sil=ok");
	}

	else
	{
		header("Location:../production/kullanici.php?sil=no");
	}
	
}


if (isset($_POST['menuduzenle'])) {
	$menu_id=$_POST['menu_id'];
	$menu_seourl=seo($_POST['menu_ad']);
	

	$ayarkaydet=$db->prepare("UPDATE menu SET 
		menu_ad=:menu_ad,
		menu_detay=:menu_detay,
		menu_url=:menu_url,
		menu_sira=:menu_sira,
		menu_seourl=:menu_seourl,
		menu_durum=:menu_durum
		WHERE menu_id={$_POST['menu_id']}");


	$update=$ayarkaydet->execute(array(
		'menu_ad'=> $_POST['menu_ad'],
		'menu_detay'=> $_POST['menu_detay'],
		'menu_url'=> $_POST['menu_url'],
		'menu_sira'=> $_POST['menu_sira'],
		'menu_seourl'=> $menu_seourl,
		'menu_durum'=> $_POST['menu_durum']
		));

	if ($update) {
		header("Location:../production/menu-duzenle.php?menu_id=$menu_id&durum=ok");
	}
	else
	{
		
		header("Location:../production/menu-duzenle.php?menu_id=$menu_id&durum=no");
	}


}

if ($_GET['slidersil']=="ok") {

	islemkontrol();
	
	$sil=$db->prepare("DELETE from slider where slider_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['slider_id']
	));

	if ($kontrol) {
		header("Location:../production/slider.php?sil=ok");
	}

	else
	{
		header("Location:../production/slider.php?sil=no");
	}
	
}


if ($_GET['menusil']=="ok") {
	
	$sil=$db->prepare("DELETE from menu where menu_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['menu_id']
	));

	if ($kontrol) {
		header("Location:../production/menu.php?sil=ok");
	}

	else
	{
		header("Location:../production/menu.php?sil=no");
	}
	
}

if (isset($_POST['menukaydet'])) {

	$menu_seourl=seo($_POST['menu_ad']);
	

	$ayarkaydet=$db->prepare("INSERT INTO menu set 
		menu_ad=:menu_ad,
		menu_detay=:menu_detay,
		menu_url=:menu_url,
		menu_sira=:menu_sira,
		menu_seourl=:menu_seourl,
		menu_durum=:menu_durum
		");


	$update=$ayarkaydet->execute(array(
		'menu_ad'=> $_POST['menu_ad'],
		'menu_detay'=> $_POST['menu_detay'],
		'menu_url'=> $_POST['menu_url'],
		'menu_sira'=> $_POST['menu_sira'],
		'menu_seourl'=> $menu_seourl,
		'menu_durum'=> $_POST['menu_durum']
		));

	if ($update) {
		header("Location:../production/menu.php?durum=ok");
	}
	else
	{
		
		header("Location:../production/menu.php?durum=no");
	}


}
	if (isset($_POST['kategoriduzenle'])) {
		$kategori_id=$_POST['kategori_id'];
		$kategori_seourl=seo($_POST['kategori_seourl']);

		$duzenle=$db->prepare("UPDATE kategori set 

			kategori_ad=:kategori_ad,
			kategori_sira=:kategori_sira,
			kategori_durum=:kategori_durum,
			kategori_seourl=:kategori_seourl
			where kategori_id={$_POST['kategori_id']}
			");
		$update=$duzenle->execute(array(

			'kategori_ad'=> $_POST['kategori_ad'],
			'kategori_sira'=> $_POST['kategori_sira'],
			'kategori_durum'=> $_POST['kategori_durum'],
			'kategori_seourl'=> $kategori_seourl
		));

		if ($update) {
			header("Location:../production/kategori-duzenle.php?durum=ok&kategori_id=$kategori_id");
		}

		else{
			header("Location:../production/kategori-duzenle.php?durum=no&kategori_id=$kategori_id");
		}

	}

	if ($_GET['kategorisil']=="ok") {
	
	$sil=$db->prepare("DELETE from kategori where kategori_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['kategori_id']
	));

	if ($kontrol) {
		header("Location:../production/kategori.php?sil=ok");
	}

	else
	{
		header("Location:../production/kategori.php?sil=no");
	}
	
}

if (isset($_POST['kategorikaydet'])) {
		
		$kategori_seourl=seo($_POST['kategori_ad']);

		$duzenle=$db->prepare("INSERT INTO kategori set 

			kategori_ad=:kategori_ad,
			kategori_sira=:kategori_sira,
			kategori_durum=:kategori_durum,
			kategori_seourl=:kategori_seourl
			
			");
		$insert=$duzenle->execute(array(

			'kategori_ad'=> $_POST['kategori_ad'],
			'kategori_sira'=> $_POST['kategori_sira'],
			'kategori_durum'=> $_POST['kategori_durum'],
			'kategori_seourl'=> $kategori_seourl
		));

		if ($insert) {
			header("Location:../production/kategori.php?durum=ok");
		}

		else{
			header("Location:../production/kategori.php?durum=no");
		}

	}

if ($_GET['urunsil']=="ok") {
	
	$sil=$db->prepare("DELETE from urun where urun_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['urun_id']
	));

	if ($kontrol) {
		header("Location:../production/urun.php?sil=ok");
	}

	else
	{
		header("Location:../production/urun.php?sil=no");
	}
	
}

if (isset($_POST['urunduzenle'])) {
	$urun_id=$_POST['urun_id'];
	$urun_seourl=seo($_POST['urun_ad']);

	$kaydet=$db->prepare("UPDATE urun set
		kategori_id=:kategori_id,
		urun_ad=:urun_ad,
		urun_detay=:urun_detay,
		urun_fiyat=:urun_fiyat,
		urun_video=:urun_video,
		urun_keyword=:urun_keyword,
		urun_stok=:urun_stok,
		urun_seourl=:urun_seourl,
		urun_onecikar=:urun_onecikar,
		urun_durum=:urun_durum
		where urun_id={$_POST['urun_id']}
		");

	$update=$kaydet->execute(array(

		'kategori_id' => $_POST['kategori_id'],
		'urun_ad' => $_POST['urun_ad'],
		'urun_detay' => $_POST['urun_detay'],
		'urun_fiyat' => $_POST['urun_fiyat'],
		'urun_video' => $_POST['urun_video'],
		'urun_keyword' => $_POST['urun_keyword'],
		'urun_stok' => $_POST['urun_stok'],
		'urun_seourl' => $urun_seourl,
		'urun_onecikar' => $_POST['urun_onecikar'],
		'urun_durum' => $_POST['urun_durum']
		
	));

	if ($update) {
			header("Location:../production/urun-duzenle.php?durum=ok&urun_id=$urun_id");
		}

		else{
			header("Location:../production/urun-duzenle.php?durum=no&urun_id=$urun_id");
		}
}

if (isset($_POST['urunkaydet'])) {
		$urun_seourl=seo($_POST['urun_ad']);

	$kaydet=$db->prepare("INSERT INTO urun set
		kategori_id=:kategori_id,
		urun_ad=:urun_ad,
		urun_detay=:urun_detay,
		urun_fiyat=:urun_fiyat,
		urun_video=:urun_video,
		urun_keyword=:urun_keyword,
		urun_stok=:urun_stok,
		urun_seourl=:urun_seourl,
		urun_durum=:urun_durum
		");

	$insert=$kaydet->execute(array(

		'kategori_id' => $_POST['kategori_id'],
		'urun_ad' => $_POST['urun_ad'],
		'urun_detay' => $_POST['urun_detay'],
		'urun_fiyat' => $_POST['urun_fiyat'],
		'urun_video' => $_POST['urun_video'],
		'urun_keyword' => $_POST['urun_keyword'],
		'urun_stok' => $_POST['urun_stok'],
		'urun_seourl' => $urun_seourl,
		'urun_durum' => $_POST['urun_durum'],
		
	));

	if ($insert) {
			header("Location:../production/urun.php?durum=ok");
		}

		else{
			header("Location:../production/urun.php?durum=no");
		}
}

if (isset($_POST['yorumukaydet'])) {
	$gelen_url=$_POST['gelen_url'];
	
	$yorum=$db->prepare("INSERT into yorumlar set


		yorum_detay=:yorum_detay,
		kullanici_id=:kullanici_id,
		urun_id=:urun_id
		");
	$ekle=$yorum->execute(array(
		'yorum_detay' =>$_POST['yorum_detay'],
		'kullanici_id' => $_POST['kullanici_id'],
		'urun_id' => $_POST['urun_id']
	));

	if ($ekle) {
		Header("Location:$gelen_url?durum=ok");
	}
	else{
		Header("Location:$gelen_url?durum=no");
	}


}


if (isset($_POST['sepeteekle'])) {
	
	
	$sepet=$db->prepare("INSERT into sepet set


		urun_adet=:urun_adet,
		kullanici_id=:kullanici_id,
		urun_id=:urun_id
		");
	$ekle=$sepet->execute(array(
		'urun_adet' =>$_POST['urun_adet'],
		'kullanici_id' => $_POST['kullanici_id'],
		'urun_id' => $_POST['urun_id']
	));

	if ($ekle) {
		Header("Location:../../sepet.php?durum=ok");
	}
	else{
		Header("Location:../../sepet.php?durum=no");
	}


}
if ($_GET['urun_onecikar']=="ok") {
	$duzenle=$db->prepare("UPDATE urun set

		urun_onecikar=:urun_onecikar
		where urun_id={$_GET['urun_id']}
		");
	$update=$duzenle->execute(array(
		'urun_onecikar' => $_GET['urun_one']
	));

	if ($update) {
		Header("Location:../production/urun.php?durum=ok");
	}
	else{
		Header("Location:../production/urun.php?durum=no");
	}
}


if ($_GET['yorum_onay']=="ok") {
	$duzenle=$db->prepare("UPDATE yorumlar set

		yorum_onay=:yorum_onay
		where yorum_id={$_GET['yorum_id']}
		");
	$update=$duzenle->execute(array(
		'yorum_onay' => $_GET['yorum_one']
	));

	if ($update) {
		Header("Location:../production/yorumlar.php?durum=ok");
	}
	else{
		Header("Location:../production/yorumlar.php?durum=no");
	}
}

if ($_GET['yorumsil']=="ok") {
	
	$sil=$db->prepare("DELETE from yorumlar where yorum_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['yorum_id']
	));

	if ($kontrol) {
		header("Location:../production/yorumlar.php?sil=ok");
	}

	else
	{
		header("Location:../production/yorumlar.php?sil=no");
	}
	
}

if (isset($_POST['bankakaydet'])) {
		
		

		$duzenle=$db->prepare("INSERT INTO banka set 

			banka_ad=:banka_ad,
			banka_iban=:banka_iban,
			banka_hesapadsoyad=:banka_hesapadsoyad,
			banka_durum=:banka_durum
			
			");
		$insert=$duzenle->execute(array(

			'banka_ad'=> $_POST['banka_ad'],
			'banka_iban'=> $_POST['banka_iban'],
			'banka_hesapadsoyad'=> $_POST['banka_hesapadsoyad'],
			'banka_durum'=> $_POST['banka_durum']
		));

		if ($insert) {
			header("Location:../production/banka.php?durum=ok");
		}

		else{
			header("Location:../production/banka.php?durum=no");
		}

	}


	if (isset($_POST['bankaduzenle'])) {
		$banka_id=$_POST['banka_id'];
		

		$duzenle=$db->prepare("UPDATE banka set 

			banka_ad=:banka_ad,
			banka_iban=:banka_iban,
			banka_hesapadsoyad=:banka_hesapadsoyad,
			banka_durum=:banka_durum
			where banka_id={$_POST['banka_id']}
			");
		$update=$duzenle->execute(array(

			'banka_ad'=> $_POST['banka_ad'],
			'banka_iban'=> $_POST['banka_iban'],
			'banka_hesapadsoyad'=> $_POST['banka_hesapadsoyad'],
			'banka_durum'=> $_POST['banka_durum']
		));

		if ($update) {
			header("Location:../production/banka-duzenle.php?durum=ok&banka_id=$banka_id");
		}

		else{
			header("Location:../production/banka-duzenle.php?durum=no&banka_id=$banka_id");
		}

	}

if ($_GET['bankasil']=="ok") {
	
	$sil=$db->prepare("DELETE from banka where banka_id=:id");
	$kontrol=$sil->execute(array(
		'id'=>$_GET['banka_id']
	));

	if ($kontrol) {
		header("Location:../production/banka.php?sil=ok");
	}

	else
	{
		header("Location:../production/banka.php?sil=no");
	}
	
}


if (isset($_POST['bankasiparisekle'])) {
	
	$siparis_tip="Banka Havalesi";



	$kaydet=$db->prepare("INSERT INTO siparis set
		kullanici_id=:kullanici_id,
		siparis_toplam=:siparis_toplam,
		siparis_tip=:siparis_tip,
		siparis_banka=:siparis_banka

		");
	$insert=$kaydet->execute(array(
		'kullanici_id'=>$_POST['kullanici_id'],
		'siparis_toplam'=>$_POST['siparis_toplam'],
		'siparis_tip'=>$siparis_tip,
		'siparis_banka'=>$_POST['siparis_banka']
	));

	if ($insert) {
		//siparis başarıyla kaydedilirse

		echo $siparis_id= $db->lastInsertId();

			echo "<hr>";
	

		$kullanici_id=$_POST['kullanici_id'];
		$sepetsor=$db->prepare("SELECT * from sepet where kullanici_id=:id ");
		$sepetsor->execute(array(
			'id' => $kullanici_id
		));

		while($sepetcek=$sepetsor->fetch(PDO::FETCH_ASSOC)){

			$urun_id=$sepetcek['urun_id'];
			$urun_adet=$sepetcek['urun_adet'];

			$urunsor=$db->prepare("SELECT * from urun where urun_id=:id");
			$urunsor->execute(array(
				'id' => $urun_id
			));

			$uruncek=$urunsor->fetch(PDO::FETCH_ASSOC);

			echo $urun_fiyat=$uruncek['urun_fiyat'];

			$kaydet=$db->prepare("INSERT INTO siparis_detay set

				siparis_id=:siparis_id,
				urun_id=:urun_id,
				urun_fiyat=:urun_fiyat,
				urun_adet=:urun_adet
				");
			$insert=$kaydet->execute(array(

				'siparis_id'=>$siparis_id,
				'urun_id'=>$urun_id,
				'urun_fiyat'=>$urun_fiyat,
				'urun_adet'=>$urun_adet

			));

		}

		if ($insert) {
			//siparis detay başarılıysa sepeti boşalt

			$sil=$db->prepare("DELETE from sepet where kullanici_id=:kullanici_id");
			$kontrol=$sil->execute(array(
				'kullanici_id' => $kullanici_id
			));

			Header("Location:../../siparislerim?durum=ok");
			exit;
		}
	}
	else{

		echo "başarısız";
	}
}

if (isset($_POST['urunfotosil'])) {
	$urun_id=$_POST['urun_id'];
	echo $checklist=$_POST['urunfotosec'];

	foreach ($checklist as $list ) {
		$sil=$db->prepare("DELETE from urunfoto where urunfoto_id=:urunfoto_id");
		$kontrol=$sil->execute(array(

			'urunfoto_id'=>$list
		));
	}

	if ($kontrol) {
		Header("Location:../production/urun-galeri.php?urun_id=$urun_id&durum=ok");
	}
	else{
		Header("Location:../production/urun-galeri.php?urun_id=$urun_id&durum=no");
	}
}

 ?>