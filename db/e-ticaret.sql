-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 02 Kas 2021, 18:42:51
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `e-ticaret`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayar`
--

CREATE TABLE `ayar` (
  `ayar_id` int(11) NOT NULL,
  `ayar_url` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_logo` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_title` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_description` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_keywords` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_author` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_tel` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_gsm` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_faks` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_mail` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `ayar_ilce` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_il` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_adress` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `ayar_mesai` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_maps` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_analystic` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_zopim` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_facebook` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_twitter` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_google` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_youtube` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_smtpuser` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_smtphost` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_smtppassword` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_smtpport` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `ayar_bakim` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ayar`
--

INSERT INTO `ayar` (`ayar_id`, `ayar_url`, `ayar_logo`, `ayar_title`, `ayar_description`, `ayar_keywords`, `ayar_author`, `ayar_tel`, `ayar_gsm`, `ayar_faks`, `ayar_mail`, `ayar_ilce`, `ayar_il`, `ayar_adress`, `ayar_mesai`, `ayar_maps`, `ayar_analystic`, `ayar_zopim`, `ayar_facebook`, `ayar_twitter`, `ayar_google`, `ayar_youtube`, `ayar_smtpuser`, `ayar_smtphost`, `ayar_smtppassword`, `ayar_smtpport`, `ayar_bakim`) VALUES
(0, 'http://joyakademi.com', 'dimg/22453asg.png', 'joy akademi eticaret scripti', 'joy akademi eticaret scripti', 'e-ticaret,shopping,learning,php', 'joy akademi', '0850 845 12 12', '0850 845 12 12', '0850 845 12 12', 'aselcukgulyer@gmail.com', 'dulkadiroğku', 'Kahramanmaraş', 'Kahramanmaraş', '7-24', 'Maps Api', 'Analystic Kodu', 'Zopim Api ', 'www.facebook.com', 'www.twitter.com', 'www.google.com', 'www.youtube.com', 'mail.alanadiniz.com', 'mail.alanadiniz.com', 'password', '587', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banka`
--

CREATE TABLE `banka` (
  `banka_id` int(11) NOT NULL,
  `banka_ad` varchar(60) COLLATE utf8_turkish_ci NOT NULL,
  `banka_iban` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `banka_hesapadsoyad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `banka_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `banka`
--

INSERT INTO `banka` (`banka_id`, `banka_ad`, `banka_iban`, `banka_hesapadsoyad`, `banka_durum`) VALUES
(1, 'ziraat', 'tr12341345141', 'selcukgukyerasd', '1'),
(3, 'Vakıf Bank', 'tr213412414', 'selcukgulyer', '1'),
(4, 'Garanti Bankası', 'TR1231231312312', 'ahmet gülyer', '1'),
(5, 'Halk Bankası', 'TR63456346436', 'asg', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `hakkimizda_id` int(11) NOT NULL,
  `hakkimizda_baslik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `hakkimizda_icerik` text COLLATE utf8_turkish_ci NOT NULL,
  `hakkimizda_video` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `hakkimizda_vizyon` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `hakkimizda_misyon` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hakkimizda`
--

INSERT INTO `hakkimizda` (`hakkimizda_id`, `hakkimizda_baslik`, `hakkimizda_icerik`, `hakkimizda_video`, `hakkimizda_vizyon`, `hakkimizda_misyon`) VALUES
(0, 'joy akademi', 'joy akademi eğitim sürümü', 'video kodu', 'joy akademi eğitim sürümü', 'joy akademi eğitim sürümü');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_ust` int(2) NOT NULL,
  `kategori_seourl` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(2) NOT NULL,
  `kategori_durum` enum('0','1') CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_ad`, `kategori_ust`, `kategori_seourl`, `kategori_sira`, `kategori_durum`) VALUES
(8, 'sadasd', 0, 'sadasd', 12, '1'),
(9, 'Ayakkabılar', 0, 'ayakkabilar', 0, '1'),
(11, 'Şapkalar', 0, 'sapkalar', 1, '1'),
(12, 'Tişörlter', 0, 'tisorlter', 3, '1'),
(13, 'Gömlekler', 0, 'gomlekler', 4, '1'),
(14, 'Bluz', 0, 'bluz', 5, '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_zaman` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kullanici_tc` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_ad` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_mail` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_gsm` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_password` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_adsoyad` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_adres` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_il` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_ilce` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_unvan` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_yetki` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kullanici_durum` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kullanici_id`, `kullanici_zaman`, `kullanici_tc`, `kullanici_ad`, `kullanici_mail`, `kullanici_gsm`, `kullanici_password`, `kullanici_adsoyad`, `kullanici_adres`, `kullanici_il`, `kullanici_ilce`, `kullanici_unvan`, `kullanici_yetki`, `kullanici_durum`) VALUES
(1, '2021-04-27 02:42:09', '12345678', 'selçuk', 'aselcukgulyer@gmail.com', '', '123456', 'selçukgülyer', 'kahramanmaras', 'kahramanmaras', 'kahramanmaras', '', '5', 1),
(2, '2021-04-28 02:26:30', '123142354', '', 'ahmet@gmail.com', '05394016180', '123456789', 'ahmet selcuk', '', '', '', '', '1', 1),
(6, '2021-04-29 02:16:22', '', '', 'asdlyer@gmail.com', '', '1234567890', 'ahmet selcuk', '', '', '', '', '1', 1),
(7, '2021-04-29 02:18:27', '', '', 'aselcukgulyeasdasdr@gmail.com', '', 'ahmetselcuk', 'ahmet selcuk', '', '', '', '', '1', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_ust` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `menu_ad` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `menu_detay` text COLLATE utf8_turkish_ci NOT NULL,
  `menu_url` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `menu_sira` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `menu_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `menu_seourl` varchar(250) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_ust`, `menu_ad`, `menu_detay`, `menu_url`, `menu_sira`, `menu_durum`, `menu_seourl`) VALUES
(4, '', 'Hakkımızda', '', 'hakkimizda', '2', '1', 'hakkimizda'),
(5, '', 'Kategoriler', '', 'kategoriler', '3', '1', 'kategoriler'),
(6, '', 'Gizlilik Koşullarımız', '<p><strong>GİZLİLİK S&Ouml;ZLEŞMESİ</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>İŞBU GİZLİLİK S&Ouml;ZLEŞMESİ</strong></p>\r\n\r\n<p>(&ldquo;S&ouml;zleşme&rdquo;) &hellip;&hellip;../&hellip;&hellip;./&hellip;&hellip;. tarihinde aşağıda yer alan taraflar arasında akdedilerek h&uuml;k&uuml;mlerini doğurmaya başlamıştır.</p>\r\n\r\n<p><strong>TARAFLAR</strong></p>\r\n\r\n<p>Bir tarafta, &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.&rsquo;da kurulmuş ve tescilli merkezi &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..&rsquo;da bulunan bir şirket olan &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;. (bundan b&ouml;yle ŞİRKET1 olarak anılacaktır.)</p>\r\n\r\n<p>Diğer tarafta, &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..&rsquo;da kurulmuş ve tescilli merkezi &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;..&rsquo;da bulunan bir şirket olan &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.. (bundan b&ouml;yle ŞİRKET2 olarak anılacaktır.)</p>\r\n\r\n<p><strong>GİRİŞ</strong></p>\r\n\r\n<p>Taraflar&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.. ve&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.. ama&ccedil;larına y&ouml;nelik olarak teknik ve tescilli bilgilerin paylaşılmasını karşılıklı olarak kabul etmişlerdir.</p>\r\n\r\n<p>Taraflar birbirileri ile olan temasları sırasında birbirlerine Madde 1&rsquo;de a&ccedil;ıklanan ve kamuya a&ccedil;ıklanmasını, umumi bilgi haline gelmesini, &uuml;&ccedil;&uuml;nc&uuml; kişilere ifşa edilmesini ve kullanımına izin verilmesini istemedikleri &ldquo;Gizli Bilgi&rdquo;yi a&ccedil;ıklayabilirler ve;</p>\r\n\r\n<p>Bu sebeple, işbu s&ouml;zleşmenin ayrılmaz bir par&ccedil;asını teşkil eden yukarıdaki giriş b&ouml;l&uuml;m&uuml; uyarınca, Taraflar aşağıdaki hususlarda mutabakata varmışlardır:</p>\r\n\r\n<ol>\r\n	<li><strong>GİZLİ BİLGİ</strong></li>\r\n</ol>\r\n\r\n<p><strong>1.1.</strong>&nbsp;Gizli Bilgi kamuya a&ccedil;ıklanmayan ve Taraflara da aralarında ger&ccedil;ekleştirecekleri bir temas ya da anlaşma gereği a&ccedil;ıklanacak olan, t&uuml;m veri, &ouml;rnek, teknik ve ekonomik bilgi, ticarileştirme, araştırma stratejisi, ticari sırlar ve know-how da dahil t&uuml;m bilgiler olarak tanımlanmaktadır.</p>\r\n\r\n<p><strong>1.2.&nbsp;</strong>Gizli Bilgi herhangi bir sınırlama olmaksızın aşağıdakileri kapsamaktadır:</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Ama&ccedil;la bağlantılı olarak diğer Tarafa a&ccedil;ıklanan yazılı ve s&ouml;zl&uuml; t&uuml;m bilgi, fikir, tahminler;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Taraflara arasındaki konuşmalar, tartışmalar, g&ouml;r&uuml;şmeler ya da toplantılar ve yazışmalar ile s&ouml;zl&uuml; olarak m&uuml;badele edilen t&uuml;m bilgiler;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Her iki taraf&ccedil;a hazırlanmış t&uuml;m analiz, derleme, &ccedil;alışma, teklif, ve diğer belgeler;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; T&uuml;m ticari anlaşmalar veya taraflar arasında akdedilen anlaşmalar, gizli bilgi alışverişini i&ccedil;eren s&ouml;zleşmeler</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Şirket satış ve şirket ortaklık s&ouml;zleşmeleri ile diğer ilgili s&ouml;zleşmeler</p>\r\n\r\n<p><strong>1.3.</strong>&nbsp;Bununla birlikte, Taraflardan her biri aşağıdaki hallerde Gizli Bilgiyi tamamen ya da kısmen ifşa edebilir ya da kullanabilir:</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Gizli bilginin işbu s&ouml;zleşmenin ihlali veya kusur dışındaki bir sebebe binaen kamunun bilgisine dahil olması;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Gizli bilginin &uuml;&ccedil;&uuml;nc&uuml; kişilerce serbest&ccedil;e iletilmesi veya kullanılmasına ifşa eden tarafın yazılı olarak muvafakat etmesi;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Gizli bilgiyi alan tarafın s&ouml;z konusu bilgiye diğer taraf&ccedil;a ifşa edilmeden &ouml;nce sahip olduğunu kanıtlaması durumunda;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Bilginin; alan tarafın diğer taraftan alınan s&ouml;z konusu Gizli Bilgiye doğrudan ya da dolaylı olarak erişme yetkisi olmayan &ccedil;alışanları veya temsilcileri tarafından bağımsız olarak geliştirilmesi durumunda;</p>\r\n\r\n<p>&ndash;&nbsp;&nbsp;&nbsp; Taraflardan birinin, yetkili mahkemenin veya resmi ya da idari makamın kararı, y&uuml;r&uuml;rl&uuml;kte bulunan kanun veya y&ouml;netmelik gereği ifşa etmekle y&uuml;k&uuml;ml&uuml; olması durumunda; bunun i&ccedil;in, bu t&uuml;r bir ifşanın &ouml;nlenmesi amacıyla gerekli t&uuml;m yasal ve makul &ouml;nlemlerin alınmış olması ve bilginin lehine tescil edildiği Tarafa ifşa ile y&uuml;k&uuml;ml&uuml; olan tarafın ifşasından &ouml;nce uygun bir koruyucu ihtiyati tedbire başvurmasına imkan verecek kadar yeterli bir s&uuml;re i&ccedil;inde ihbarda bulunulması gerekmektedir.</p>\r\n\r\n<ol>\r\n	<li><strong>GİZLİLİĞE İLİŞKİN Y&Uuml;K&Uuml;ML&Uuml;L&Uuml;KLER</strong></li>\r\n</ol>\r\n\r\n<p><strong>2.1.&nbsp;</strong>İşbu S&ouml;zleşmenin imzalanması ile Taraflardan her biri Gizli nitelikteki t&uuml;m bilgileri kesinlikle &ouml;zel ve gizli tutmayı, bunu bir sır saklama y&uuml;k&uuml;m&uuml; olarak addetmeyi ve gizliliğin sağlanması ve s&uuml;rd&uuml;r&uuml;lmesi, Gizli Bilginin veya herhangi bir kısmının kamu alanına girmesini veya ifşa eden tarafın yazlı muvafakatini gerektiren bilgiyi alan tarafın &ccedil;alışanları hari&ccedil; &uuml;&ccedil;&uuml;nc&uuml; bir kişiye ifşasını &ouml;nlemek i&ccedil;in gerekli t&uuml;m tedbirleri almayı ve gerekli &ouml;zeni g&ouml;stermeyi taahh&uuml;t etmişlerdir.</p>\r\n\r\n<p><strong>2.2. Bununla birlikte, Taraflardan her biri işbu S&ouml;zleşme ile a&ccedil;ık&ccedil;a:</strong></p>\r\n\r\n<ol>\r\n	<li><strong>a)&nbsp;</strong>Gizli Bilgiyi her ne sebeple olursa olsun, doğrudan ya da dolaylı olarak kendisinin ya da herhangi bir &uuml;&ccedil;&uuml;nc&uuml; kişinin yararına kullanmamayı, ifşa eden Taraf&ccedil;a izin verilen ama&ccedil; dışındaki bir ama&ccedil; i&ccedil;in kullanılmasına izin vermemeyi,</li>\r\n	<li><strong>b)&nbsp;</strong>Hi&ccedil;bir Gizli Bilgiyi, herhangi bir &uuml;&ccedil;&uuml;nc&uuml; kişiye, firmaya, acentaya veya kuruma a&ccedil;ıklamamayı, rapor etmemeyi, yayınlamamayı veya ifşa etmemeyi veyahut işbu maddenin hangi şekilde olursa olsun b&ouml;yle bir ifşadan ka&ccedil;ınmak i&ccedil;in (c) fıkrasında belirtilenler hari&ccedil; gerekli t&uuml;m hukuki ya da diğer tedbirleri alma</li>\r\n	<li><strong>c)&nbsp;</strong>Gizli Bilgiyi katı bir &ldquo;bilinmesi gereklilik arz etme&rdquo; temelinde ancak ifşa eden Tarafın a&ccedil;ık yazılı muvafakati &uuml;zerine &ccedil;alışanlara, vekil veya temsilcilere, bunların da en az işbu S&ouml;zleşmede yer alanlardan daha az katı olmayan y&uuml;k&uuml;ml&uuml;l&uuml;klerle bağlı olmaları şartıyla a&ccedil;ıklamayı taahh&uuml;t etmektedir.</li>\r\n</ol>\r\n\r\n<p><strong>2.3.&nbsp;</strong>ŞİRKET1 veya onunla doğrudan ya da dolaylı olarak bağlantılı şirket veya kuruluşlar İşbu S&ouml;zleşmeyle:</p>\r\n\r\n<ol>\r\n	<li><strong>a)&nbsp;</strong>Hi&ccedil;bir şekilde, ŞİRKET2&rsquo;de &ccedil;alışan veya ge&ccedil;mişte &ccedil;alışmış veya İşbu S&ouml;zleşmenin h&uuml;k&uuml;mlerinin y&uuml;r&uuml;rl&uuml;kte kaldığı s&uuml;re i&ccedil;erisinde istifa eden veya işten &ccedil;ıkartılan iş&ccedil;ileri kendisine transfer etmeyeceğini</li>\r\n	<li><strong>b)&nbsp;</strong>Hi&ccedil;bir durumda ŞİRKET2&rsquo;nin yazılı izni olmaksızın teknoloji transfer etmeyeceğini</li>\r\n</ol>\r\n\r\n<p>kabul ve taahh&uuml;t eder.</p>\r\n\r\n<ol>\r\n	<li><strong>GİZLİ BİLGİNİN KOPYALANMASI</strong></li>\r\n</ol>\r\n\r\n<p>Taraflardan her biri, a&ccedil;ık&ccedil;a, Gizli Bilginin ilgili tarafın &ouml;nceden vereceği yazılı muvafakati olmaksızın tamamen veya kısmen kopyalanmayacağını taahh&uuml;t eder.</p>\r\n\r\n<ol>\r\n	<li><strong>GİZLİ BİLGİNİN İADE EDİLMESİ</strong></li>\r\n</ol>\r\n\r\n<p><strong>4.1.&nbsp;</strong>Taraflardan her biri, S&ouml;zleşmenin sona erdiği durumlarda, diğer y&uuml;k&uuml;ml&uuml;l&uuml;klere halel gelmeksizin İşbu S&ouml;zleşme gereği aşağıdaki y&uuml;k&uuml;ml&uuml;l&uuml;klerle bağlı olduğunu kabul eder:</p>\r\n\r\n<ul>\r\n	<li>Gizli Bilgi i&ccedil;eren t&uuml;m belgeler İfşa eden tarafa ya da ifşa eden taraf&ccedil;a belirlenen diğer kişilere iade edilecektir.</li>\r\n	<li>Bu t&uuml;r belgelerin suretleri, ve ifşa eden taraf&ccedil;a veya onun adına ya da temsilcileri veya paragraf 2.2&rsquo;de belirtilen kendilerine Gizli Bilgi a&ccedil;ıklanan kişiler tarafından hazırlanan rapor, derleme, analiz, yorumlar imha edilecektir.</li>\r\n	<li>Gizli Bilginin kaydedildiği bilgisayarda bulunan ve gizli bilgiyi alan taraf ya da temsilcileri ya da yukarıda bahsi ge&ccedil;en paragraf 2.2&rsquo;de belirtilen kişiler tarafından bulundurulan suretleri silinecektir.</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li><strong>TAZMİN</strong></li>\r\n</ol>\r\n\r\n<p><strong>5.1.</strong>&nbsp;Taraflardan her biri, işbu S&ouml;zleşme tarafından kendilerine y&uuml;klenen y&uuml;k&uuml;ml&uuml;l&uuml;klerden herhangi birinin ihlali halinde, Gizli Bilginin iade edilmesine rağmen diğer tarafın sırf yukarıda bahsedilen y&uuml;k&uuml;ml&uuml;l&uuml;klerin ihlal edilmesi sebebiyle &ouml;nemli bir zarara uğrayabileceğini kabul eder. Bu sebeple, taraflardan her biri diğer tarafın uğradığı b&ouml;yle bir zararı tamamen tazmin edeceğini taahh&uuml;t eder.</p>\r\n\r\n<p><strong>5.2</strong>&nbsp;Taraflardan her biri, Gizliliğe y&ouml;nelik her t&uuml;r tehdidi &ouml;nleme veya devam eden gizliliğin bilgiyi alan taraf&ccedil;a ihlalini hukuki yollarla durdurma hakkına sahip olduklarını ve ihlalde bulunan taraf aleyhine karar elde edilmesi durumunda, s&ouml;z konusu taraf diğer tarafın avuktlık &uuml;creti de dahil olmak &uuml;zere yargılama masraf ve giderlerini tazmin edeceğini kabul eder.</p>\r\n\r\n<ol>\r\n	<li><strong>S&Ouml;ZLEŞME, İŞLEM VE G&Ouml;R&Uuml;ŞMELERİN GİZLİLİĞİ</strong></li>\r\n</ol>\r\n\r\n<p><strong>6.1.&nbsp;</strong>İşlemler ve işbu S&ouml;zleşme h&uuml;k&uuml;mleri ve ger&ccedil;ekleşecek g&ouml;r&uuml;şmelerin i&ccedil;erikleri kesinlikle gizli tutulacaktır.</p>\r\n\r\n<p><strong>6.2.&nbsp;</strong>Umuma yapılacak ilanlara y&ouml;nelik olarak ilgili Taraflar karşılıklı olarak karar verecektir.</p>\r\n\r\n<ol>\r\n	<li><strong>S&Uuml;RE</strong></li>\r\n</ol>\r\n\r\n<p><strong>7.1.&nbsp;</strong>İşbu S&ouml;zleşme yukarıda belirtilen imza tarihinde y&uuml;r&uuml;rl&uuml;ğe girecek (y&uuml;r&uuml;rl&uuml;k tarihi) ve &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;. s&uuml;re i&ccedil;in y&uuml;r&uuml;rl&uuml;kte kalacaktır.</p>\r\n\r\n<p><strong>7.2.&nbsp;</strong>İşbu S&ouml;zleşmenin sona ermesine rağmen, gizlilik y&uuml;k&uuml;ml&uuml;l&uuml;kleri, alan tarafa a&ccedil;ıklanan Gizli Bilgi gizlilik &ouml;zelliğini kaybedene kadar devam edecektir.</p>\r\n\r\n<ol>\r\n	<li><strong>UYGULANACAK HUKUK</strong></li>\r\n</ol>\r\n\r\n<p><strong>8.1.&nbsp;</strong>İşbu S&ouml;zleşme &hellip;&hellip;. Hukukuna uygun olarak akdedilecek ve uygulanacaktır.</p>\r\n\r\n<ol>\r\n	<li><strong>YETKİLİ MAHKEME</strong></li>\r\n</ol>\r\n\r\n<p><strong>9.1.&nbsp;</strong>İşbu S&ouml;zleşmeden doğan t&uuml;m uyuşmazlık, iddia ve &ccedil;atışmalara y&ouml;nelik olarak &hellip;&hellip;&hellip;&hellip;&hellip;.Makemeleri ve icra daireleri yetkilidir.</p>\r\n\r\n<ol>\r\n	<li><strong>İHBARLAR</strong></li>\r\n</ol>\r\n\r\n<p><strong>10.1.</strong>&nbsp;İşbu S&ouml;zleşme uyarınca yapılacak t&uuml;m ihbarlar yazılı olarak aşağıdaki usullerden birine g&ouml;re yapılacaktır:</p>\r\n\r\n<ol>\r\n	<li><strong>a)&nbsp;</strong>Kurye veya iadeli taahh&uuml;tl&uuml; mektup ile tarafların aşağıda belirtilen ihbar adreslerine g&ouml;nderilecek;</li>\r\n	<li><strong>b)&nbsp;</strong>Fax, elektronik posta yolu ile g&ouml;nderilerek, kurye veya iadeli taahh&uuml;tl&uuml; mektup ile teyid edilecektir. Bu durumda ihbarlar nihai olarak adreste bulunan tarafından imzalanmış posta alındısının &uuml;st&uuml;nde yer alan tarihten daha ge&ccedil; olmayan bir tarihte alınmış kabul edilecektir.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ŞİRKET 1 :</p>\r\n\r\n<p>Adres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>Fax No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>E-mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ŞİRKET 2 :</p>\r\n\r\n<p>Adres&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>Fax No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>E-mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol>\r\n	<li>&Ccedil;EŞİTLİ H&Uuml;K&Uuml;MLER</li>\r\n</ol>\r\n\r\n<p><strong>11.1.&nbsp;</strong>Taraflardan her biri, işbu S&ouml;zleşmeyle birbirlerine a&ccedil;ıkladıkları bilginin tam ve doğru olduğunu beyan ve taahh&uuml;t ederler. İşbu paragrafta belirtilen y&uuml;k&uuml;ml&uuml;l&uuml;ğ&uuml; ihlal eden Taraf, diğer tarafa verdiği zarar ve ziyanı tazmin edecektir.</p>\r\n\r\n<p><strong>11.2.&nbsp;</strong>İşbu S&ouml;zleşmenin h&uuml;k&uuml;mlerine yazılı bir s&ouml;zleşme olmaksızın atıfta veya ilavede bulunulamaz.</p>\r\n\r\n<p><strong>11.3.&nbsp;</strong>İşbu S&ouml;zleşmede yar alan taahh&uuml;tler Tarafların doğrudan ya da dolaylı kontrol&uuml; altında bulunan ya da kontrol&uuml; altında bulunduğu şirket ve gruplar ve bunların vekil ve halefleri i&ccedil;in de bağlayıcıdır.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ŞİRKET 1 adına&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>İmza&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>İsim&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>&Uuml;nvan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ŞİRKET 2 adına&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>İmza&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>İsim&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n\r\n<p>&Uuml;nvan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</p>\r\n', '', '5', '1', 'gizlilik-kosullarimiz'),
(7, '', 'İletişim', '', 'iletisim.php', '6', '1', 'iletisim');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepet`
--

CREATE TABLE `sepet` (
  `sepet_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `urun_adet` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sepet`
--

INSERT INTO `sepet` (`sepet_id`, `kullanici_id`, `urun_id`, `urun_adet`) VALUES
(6, 2, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE `siparis` (
  `siparis_id` int(11) NOT NULL,
  `siparis_zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `siparis_no` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `siparis_toplam` float(9,2) NOT NULL,
  `siparis_tip` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `siparis_banka` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `siparis_odeme` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparis`
--

INSERT INTO `siparis` (`siparis_id`, `siparis_zaman`, `siparis_no`, `kullanici_id`, `siparis_toplam`, `siparis_tip`, `siparis_banka`, `siparis_odeme`) VALUES
(750000, '2021-05-05 15:13:15', 0, 2, 0.00, 'Banka Havalesi', 'Halk Bankası', '0'),
(750001, '2021-05-05 15:13:24', 0, 2, 0.00, 'Banka Havalesi', 'Halk Bankası', '0'),
(750002, '2021-05-05 15:14:18', 0, 2, 0.00, 'Banka Havalesi', 'ziraat', '0'),
(750003, '2021-05-05 15:15:33', 0, 2, 0.00, 'Banka Havalesi', 'Vakıf Bank', '0'),
(750004, '2021-05-05 15:15:45', 0, 2, 0.00, 'Banka Havalesi', 'Vakıf Bank', '0'),
(750005, '2021-05-05 15:52:06', 0, 2, 125.00, 'Banka Havalesi', 'Garanti Bankası', '0'),
(750006, '2021-05-05 15:52:51', 0, 2, 125.00, 'Banka Havalesi', 'Vakıf Bank', '0'),
(750007, '2021-05-05 15:58:15', 0, 2, 125.00, 'Banka Havalesi', 'Garanti Bankası', '0'),
(750008, '2021-05-05 15:59:34', 0, 2, 125.00, 'Banka Havalesi', 'ziraat', '0'),
(750009, '2021-05-05 16:00:32', 0, 2, 125.00, 'Banka Havalesi', 'ziraat', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis_detay`
--

CREATE TABLE `siparis_detay` (
  `siparisdetay_id` int(11) NOT NULL,
  `siparis_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `urun_fiyat` float(9,2) NOT NULL,
  `urun_adet` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparis_detay`
--

INSERT INTO `siparis_detay` (`siparisdetay_id`, `siparis_id`, `urun_id`, `urun_fiyat`, `urun_adet`) VALUES
(1, 750003, 10, 125.00, 1),
(2, 750003, 9, 250.00, 3),
(3, 750003, 9, 250.00, 3),
(4, 750003, 1, 100.00, 1),
(5, 750009, 8, 125.00, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `slider_ad` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `slider_resimyol` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `slider_link` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `slider_sira` int(2) NOT NULL,
  `slider_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `slider`
--

INSERT INTO `slider` (`slider_id`, `slider_ad`, `slider_resimyol`, `slider_link`, `slider_sira`, `slider_durum`) VALUES
(4, 'slider1', 'dimg/slider/31958278052309426241slide-1.jpg', '', 1, '1'),
(5, 'slider2', 'dimg/slider/23011260252769923961slide-2.jpg', '', 2, '1'),
(6, 'slider3', 'dimg/slider/27153268993197721346slide-3.jpg', '', 3, '1'),
(7, 'slider4', 'dimg/slider/26017286062630327085slide-4.jpg', '', 4, '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

CREATE TABLE `urun` (
  `urun_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `urun_ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_zaman` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `urun_seourl` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_detay` text COLLATE utf8_turkish_ci NOT NULL,
  `urun_fiyat` float(9,2) NOT NULL,
  `urun_video` varchar(200) COLLATE utf8_turkish_ci NOT NULL,
  `urun_keyword` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_stok` int(11) NOT NULL,
  `urun_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `urun_onecikar` enum('0','1') CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`urun_id`, `kategori_id`, `urun_ad`, `urun_zaman`, `urun_seourl`, `urun_detay`, `urun_fiyat`, `urun_video`, `urun_keyword`, `urun_stok`, `urun_durum`, `urun_onecikar`) VALUES
(1, 13, 'Mavi Çizgili Gömlek', '2021-05-01 01:57:15', 'mavi-cizgili-gomlek', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 100.00, 'btGU01n8fpI', 'asdasd', 150, '1', '1'),
(8, 12, 'sweat', '2021-05-01 03:14:13', 'sweat', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 125.00, '', 'wdasd', 50, '1', '1'),
(9, 13, 'Dar Kesim', '2021-05-01 03:14:49', 'dar-kesim', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 250.00, '', 'wdasd', 65, '1', '1'),
(10, 8, 'sweat', '2021-05-01 18:22:51', 'sweat', '', 125.00, '', 'asdasd', 50, '1', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunfoto`
--

CREATE TABLE `urunfoto` (
  `urunfoto_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `urunfoto_resimyol` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urunfoto_sira` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urunfoto`
--

INSERT INTO `urunfoto` (`urunfoto_id`, `urun_id`, `urunfoto_resimyol`, `urunfoto_sira`) VALUES
(1, 1, 'dimg/urun/2701621276271792586721.jpg', 0),
(2, 1, 'dimg/urun/2482330534293002213121.jpg', 0),
(3, 1, 'dimg/urun/21464315482761631339asg.png', 0),
(4, 1, 'dimg/urun/2681731771224623167660c2177448cbf90408ed1df7da78cf00.jpg', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

CREATE TABLE `yorumlar` (
  `yorum_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `yorum_detay` text COLLATE utf8_turkish_ci NOT NULL,
  `yorum_zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `urun_id` int(11) NOT NULL,
  `yorum_onay` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yorumlar`
--

INSERT INTO `yorumlar` (`yorum_id`, `kullanici_id`, `yorum_detay`, `yorum_zaman`, `urun_id`, `yorum_onay`) VALUES
(8, 2, 'fena', '2021-05-03 13:59:16', 8, '1'),
(9, 2, 'abi bu ne yaaaa\r\n', '2021-05-03 13:59:30', 8, '0'),
(10, 2, 'efsane ötesii', '2021-05-03 13:59:52', 1, '0'),
(11, 2, 'asfdsad', '2021-05-04 15:58:21', 8, '0'),
(12, 2, 'asdfads', '2021-05-04 15:58:49', 8, '0'),
(13, 2, 'asdad', '2021-05-04 15:58:55', 8, '0'),
(14, 2, 'ahmet gülyer', '2021-05-04 15:59:10', 8, '1');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayar`
--
ALTER TABLE `ayar`
  ADD PRIMARY KEY (`ayar_id`);

--
-- Tablo için indeksler `banka`
--
ALTER TABLE `banka`
  ADD PRIMARY KEY (`banka_id`);

--
-- Tablo için indeksler `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`hakkimizda_id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`);

--
-- Tablo için indeksler `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Tablo için indeksler `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`sepet_id`);

--
-- Tablo için indeksler `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`siparis_id`);

--
-- Tablo için indeksler `siparis_detay`
--
ALTER TABLE `siparis_detay`
  ADD PRIMARY KEY (`siparisdetay_id`);

--
-- Tablo için indeksler `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`urun_id`);

--
-- Tablo için indeksler `urunfoto`
--
ALTER TABLE `urunfoto`
  ADD PRIMARY KEY (`urunfoto_id`);

--
-- Tablo için indeksler `yorumlar`
--
ALTER TABLE `yorumlar`
  ADD PRIMARY KEY (`yorum_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `banka`
--
ALTER TABLE `banka`
  MODIFY `banka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `sepet`
--
ALTER TABLE `sepet`
  MODIFY `sepet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `siparis`
--
ALTER TABLE `siparis`
  MODIFY `siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=750010;

--
-- Tablo için AUTO_INCREMENT değeri `siparis_detay`
--
ALTER TABLE `siparis_detay`
  MODIFY `siparisdetay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `urunfoto`
--
ALTER TABLE `urunfoto`
  MODIFY `urunfoto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `yorumlar`
--
ALTER TABLE `yorumlar`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
