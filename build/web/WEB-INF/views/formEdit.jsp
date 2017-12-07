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
      
      <center><h2 class="buku">FROM EDIT DATA</h2></center><br>
    
     <div class="container">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="panel-title"><h1></h1></div>
        </div>
        <div class="panel-body">
            
            <form name="add" method="post" action="editBuku">
           
                <label for="judul">Judul Buku</label>  
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <input name="judul" id="judul" placeholder="judul buku" class="form-control"  type="text">
                    </div>
                
                 <label for="tahun">Tahun Buku</label>  
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <input name="tahun" id="tahun" placeholder="tahun buku" class="form-control"  type="text">
                    </div>
                 
                 <label for="penerbit">Penerbit Buku</label>  
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <input name="penerbit" id="penerbit" placeholder="penerbit buku" class="form-control"  type="text">
                    </div>
                 
                 <label for="penulis">Penulis Buku</label>  
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <input name="penulis" id="penulis" placeholder="penulis buku" class="form-control"  type="text">
                    </div>
                
                 <label for="penerbit">Penerbit Buku</label>  
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <input name="penerbit" id="penerbit" placeholder="penerbit buku" class="form-control"  type="text">
                    </div>
                 
                 <label for="harga">Harga Buku</label>  
                    <div class="input-group">
                        <span class="input-group-addon"></span>
                        <input name="harga" id="harga" placeholder="harga buku" class="form-control"  type="text">
                    </div>
                 
                 
                 <div class="btn-group">
                 <button class="btn btn-primary btn-fill" type="submit" value="Edit"><span class="glyphicon glyphicon-plus-sign"></span> Tambah</button>
                 <button class="btn btn-primary" type="reset" onclick="history.back()" value="Reset">Reset<span class="glyphicon glyphicon-record"></span></button>
                 </div>
                     
            </form>
    
         </div>
      </div>
    </div>
   
   </body>
   
  </body>
  <body>
    <div class="container">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="panel-title"><h1>Form Edit Data <% $jenis = ($tipe=='buku') ? 'Buku' : 'Anggota' ; echo $jenis; %></h1></div>
        </div>
        <div class="panel-body">
          <%
            function jenis($x, $g)
            {
              if($x==$g) return 'checked';
            }
            echo anchor("the_sociolib/index/{$tipe}", "<span class='glyphicon glyphicon-hand-left'></span> Kembali", array('class' => 'btn btn-default'));
            echo "<br><br>".form_open("the_sociolib/postEdit/{$tipe}/{$query[0]->id}");
            if ($tipe=='buku') {
              $a=array('name' => 'judul', 'value' => $query[0]->judul, 'class' => 'form-control');
              echo '<label>Judul :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'tahun', 'value' => $query[0]->tahun, 'class' => 'form-control');
              echo '<label>Tahun :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'penerbit', 'value' => $query[0]->penerbit, 'class' => 'form-control');
              echo '<label>Penerbit :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'penulis', 'value' => $query[0]->penulis, 'class' => 'form-control');
              echo '<label>Penulis :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'harga', 'value' => $query[0]->harga, 'class' => 'form-control');
              echo '<label>Harga (Rupiah):</label><br>'.form_input($a)."<br>";
            } else {
              $a=array('name' => 'nama', 'value' => $query[0]->nama, 'class' => 'form-control');
              echo '<label>Nama :</label><br>'.form_input($a)."<br>";

              // $a=array('name' => 'gender', 'value' => $query[0]->gender, 'class' => 'form-control');
              // echo '<label>Gender :</label><br>'.form_input($a)."<br>";
              $l=array('name' => 'gender', 'value' => 'L', 'checked' => jenis($query[0]->gender, "L"), 'data-toggle' => 'radio');
              $p=array('name' => 'gender', 'value' => 'P', 'checked' => jenis($query[0]->gender, "P"), 'data-toggle' => 'radio');
              echo '<label>Gender :</label><br>
              <label class="radio">'.form_radio($l).'<i></i>Laki-laki</label>
              <label class="radio">'.form_radio($p).'<i></i>Perempuan</label>';

              $a=array('name' => 'tgl_lahir', 'value' => $query[0]->tgl_lahir, 'class' => 'form-control');
              echo '<label>Tanggal Lahir :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'alamat', 'value' => $query[0]->alamat, 'class' => 'form-control');
              echo '<label>Alamat :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'pekerjaan', 'value' => $query[0]->pekerjaan, 'class' => 'form-control');
              echo '<label>Pekerjaan :</label><br>'.form_input($a)."<br>";
              $a=array('name' => 'no_hp', 'value' => $query[0]->no_hp, 'class' => 'form-control');
              echo '<label>Nomor HP :</label><br>'.form_input($a)."<br>";
            }

            echo '<div class="btn-group">';
            echo '<button class="btn btn-primary btn-fill" type="submit"><span class="glyphicon glyphicon-check"></span> Commit</button>';
            /* buku   : id, judul, tahun, penerbit, penulis
               anggota: id, nama, gender, alamat, no_hp */
            echo anchor("the_sociolib/delete/{$tipe}/{$query[0]->id}", "Hapus <span class='glyphicon glyphicon-trash'></span>", array('class' => 'btn btn-danger'));
            echo "</div>";
          %>
        </div>
      </div>
    </div>
  </body>
</html>
