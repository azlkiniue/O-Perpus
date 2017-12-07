<html>
  <head>
   <title>Database</title>
   <link rel="stylesheet" href="/Project_Library/assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="/Project_Library/assets/css/light-bootstrap-dashboard.css">
   <link rel="stylesheet" href="/Project_Library/assets/css/animate.min.css">
   <link rel="stylesheet" href="/Project_Library/assets/font-awesome/css/font-awesome.min.css">
   <!-- <link rel="stylesheet" href="<?php echo base_url("assets/css/pe-icon-7-stroke.css") ?>"> -->
   <script src="/Project_Library/assets/js/jquery-1.12.4.js"></script>
   <script src="/Project_Library/assets/js/bootstrap.min.js"></script>
   <script src="/Project_Library/assets/js/light-bootstrap-dashboard.js"></script>
   <script src="/Project_Library/assets/js/bootstrap-checkbox-radio-switch.js"></script>
   <script src="/Project_Library/assets/js/bootstrap-notify.js"></script>
  </head>
  <style media="screen">
  .panel{
    margin-top: 10px;
  }
  </style>
  
  <body>
      
    <!--<center><h2 class="buku">TAMBAH BUKU</h2></center><br>-->
    
     <div class="container">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="panel-title"><h1>FORM TAMBAH BUKU</h1></div>
        </div>
        <div class="panel-body">
            <a href="/Project_Library/buku" class='btn btn-default'><span class='glyphicon glyphicon-hand-left'></span> Kembali</a><br><br>
            <form name="add" method="post" action="">
           
                
                <label for="judul">Judul Buku</label><br>
                    <input name="judul" id="judul" placeholder="judul buku" class="form-control"  type="text"><br>
                
                <label for="tahun">Tahun Terbit</label><br>
                    <input name="tahun" id="tahun" placeholder="tahun buku" class="form-control"  type="text"><br>
                 
                <label for="penerbit">Penerbit Buku</label><br>
                    <input name="penerbit" id="penerbit" placeholder="penerbit buku" class="form-control"  type="text"><br>
                 
                <label for="penulis">Penulis Buku</label><br>
                    <input name="penulis" id="penulis" placeholder="penulis buku" class="form-control"  type="text"><br>
                 
                 <label for="harga">Harga Buku</label><br>
                    <input name="harga" id="harga" placeholder="harga buku" class="form-control"  type="text"><br>
                 
                  <div class="btn-group">
                 <button class="btn btn-primary btn-fill" type="submit" value="Tambah"><span class="glyphicon glyphicon-plus-sign"></span> Tambah</button>
                 <button class="btn btn-primary" type="reset" value="Reset">Reset <span class="glyphicon glyphicon-record"></span></button>
                 </div>
                 
                 </form>
                 
         </div>
      </div>
    </div>
   
   </body>
   
   
   
  <!--<body>
    <div class="container">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="panel-title"><h1>Form Tambah <%-- $jenis = ($tipe=='buku') ? 'Buku' : 'Anggota' ; echo $jenis; --%> Baru</h1></div>
        </div>
        <div class="panel-body">
          <%--
            echo anchor("the_sociolib/index/{$tipe}", "<span class='glyphicon glyphicon-hand-left'></span> Kembali", array('class' => 'btn btn-default'));
            echo "<br><br>".form_open("the_sociolib/postInsert/{$tipe}");
            if ($tipe=='buku') {
              $a=array('name' => 'judul', 'class' => 'form-control');
              echo '<label>Judul :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'tahun', 'class' => 'form-control');
              echo '<label>Tahun :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'penerbit', 'class' => 'form-control');
              echo '<label>Penerbit :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'penulis', 'class' => 'form-control');
              echo '<label>Penulis :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'harga', 'class' => 'form-control');
              echo '<label>Harga (Rupiah):</label><br>'.form_input($a)."<br>";
            } else {
              $a=array('name' => 'nama', 'class' => 'form-control');
              echo '<label>Nama :</label><br>'.form_input($a)."<br>";

              // echo '<label class="radio-inline"><input type="radio" name="gender1" value="L" echo jenis($row["gender"], "L") > Pria</label>
              // <label class="radio-inline"><input type="radio" name="gender1" value="P" <?php echo jenis($row["gender"], "P") > Wanita</label>';
              $l=array('name' => 'gender', 'value' => 'L', 'data-toggle' => 'radio');
              $p=array('name' => 'gender', 'value' => 'P', 'data-toggle' => 'radio');
              echo '<label>Gender :</label><br>
              <label class="radio">'.form_radio($l).'Laki-laki</label>
              <label class="radio">'.form_radio($p).'Perempuan</label>';

              $a=array('name' => 'tgl_lahir', 'class' => 'form-control', 'placeholder' => 'YYYY/MM/DD');
              echo '<label>Tanggal Lahir :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'alamat', 'class' => 'form-control');
              echo '<label>Alamat :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'pekerjaan', 'class' => 'form-control');
              echo '<label>Pekerjaan :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'no_hp', 'class' => 'form-control');
              echo '<label>Nomor HP :</label><br>'.form_input($a)."<br>";
            }

            echo '<div class="btn-group">';
            echo '<button class="btn btn-primary btn-fill" type="submit"><span class="glyphicon glyphicon-plus-sign"></span> Tambah</button>';
            echo '<button class="btn btn-primary" type="reset">Reset <span class="glyphicon glyphicon-record"></span></button></div>';
            /* buku   : id, judul, tahun, penerbit, penulis
               anggota: id, nama, gender, alamat, no_hp */
          --%>

        </div>
      </div>
    </div>
  </body>-->
</html>
