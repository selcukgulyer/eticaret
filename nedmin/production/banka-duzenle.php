<?php 
include'header.php';


  $bankasor=$db->prepare("SELECT * from banka where banka_id=:id" );
  $bankasor->execute(array
    (
      'id' => $_GET['banka_id']
    ));

  $bankacek=$bankasor->fetch(PDO::FETCH_ASSOC);

 ?>

 <head>
  <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
</head>

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
          
            <div class="clearfix"></div>
            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Banka Düzenleme <small>
                      
                     <?php
                    if (isset($_GET['durum'])) {
                       if ($_GET['durum']=="ok") {?> 
                      <b style="color:green;">İşlem başarılı...</b>
                    <?php } elseif ($_GET['durum']=="no") {?>
                       <b style="color:red;">İşlem Başarısız...</b> 
                     
                    <?php }

     
                     
                    }
                    ?>
                   
                    </small></h2>

                   
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-banka" role="banka">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br />
                    <form action="../netting/islem.php" method="POST" id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">


                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Banka Ad<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name="banka_ad" required="required" value="<?php echo $bankacek['banka_ad'] ?>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Banka İban<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name="banka_iban" required="required" value="<?php echo $bankacek['banka_iban'] ?>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Banka Hesap Ad Soyad<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="first-name" name="banka_hesapadsoyad" required="required" value="<?php echo $bankacek['banka_hesapadsoyad'] ?>" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>


                        <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Durum<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select type="text" id="first-name" name="banka_durum"  required="required" class="form-control">

    
                          <option value="1" <?php echo $bankacek['banka_durum']=='1' ? 'selected=""' : ''; ?>>
                            
                          Aktif</option>

                          <option value="0" <?php echo $bankacek['banka_durum']=='0' ? 'selected=""' : ''; ?>>
                            
                          Pasif</option>
                          </select>
                        </div>
                      </div>

                       

                      <input type="hidden" name="banka_id" value=" <?php echo $bankacek['banka_id'] ?>">

                      



                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div align="right" class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          
                          <button type="submit" name="bankaduzenle" class="btn btn-success">Güncelle</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        
     <?php include 'footer.php'; ?>
