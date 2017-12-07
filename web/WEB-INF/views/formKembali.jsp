<%@page import="com.project.entity.PeminjamanDetailModel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    .ct-red.checkbox.checked .second-icon, .ct-red.radio.checked .second-icon, .ct-red.checkbox.checked, .ct-red.radio.checked {
    	color: #FF3B30;
    }
    /*#boxes{
      margin-top: 4px;
    }*/
  </style>
  
  <body>
     <div class="container">
      <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="panel-title"><h1>PENGEMBALIAN BUKU</h1></div>
        </div>
        <div class="panel-body">
            <a href="/Project_Library/peminjaman" class='btn btn-default'><span class='glyphicon glyphicon-hand-left'></span> Kembali</a><br><br>
            <c:set var="model" value="${peminjamanDetailModel}"/><c:set var="telat" value="${telat}"/>
            <%
                PeminjamanDetailModel pDetailModel = new PeminjamanDetailModel();
                pDetailModel = (PeminjamanDetailModel) pageContext.getAttribute("model");
            %>
            <script>
              $(document).ready(function(){
                $('#check').click(function(){
                  if ( $('#check').attr('class') === 'checkbox ct-red checked' ) {
                      // do this
                      document.getElementById("form").action="<%= "/Project_Library/peminjaman/kembali?telat="+ pageContext.getAttribute("telat") +"&hilang=false" %>";
                  } else {
                      // do that
                      document.getElementById("form").action="<% int harga = (pDetailModel.getBukuModel().getHarga()==0) ? 50000 : pDetailModel.getBukuModel().getHarga(); 
                                        out.print("/Project_Library/peminjaman/kembali?telat="+ pageContext.getAttribute("telat") +"&hilang="+ harga);%>";
                  }
                });
              });
            </script>
            <form id="form" method="post" action="/Project_Library/peminjaman/kembali?telat=<%= pageContext.getAttribute("telat") %>&id=<%= pDetailModel.getId() %>&hilang=false">
                <div style="display:none">
                <label for="id_buku">Judul Buku</label>
                <input name="id_buku" id="judul" placeholder="judul buku" class="form-control" value="<%= pDetailModel.getId_buku() %>" type="text">
                <label for="no_transaksi">No Transaksi</label>
                <input name="no_transaksi" id="nama" placeholder="nama" class="form-control" value="<%= pDetailModel.getNo_transaksi() %>" type="text">
                <label for="id">ID</label>
                <input name="id" id="tanggal" placeholder="tanggal pinjam" class="form-control" value="<%= pDetailModel.getId() %>" type="text">
                </div>

                <label>Nama Anggota:</label><p class='form-control-static'><%= pDetailModel.getPeminjamanMasterModels().getAnggotaModel().getNama() %></p><br>
                <label>Judul Buku:</label><p class='form-control-static'><%= pDetailModel.getBukuModel().getJudul() %></p><br>
                <label>Tanggal Pinjam :</label><p class='form-control-static'><%= pDetailModel.getPeminjamanMasterModels().getTgl_pinjam() %></p><br>
                <label>Buku Hilang :  </label>
                <label class="checkbox ct-red" id="check" for="checkbox1">
                  <input type="checkbox" value="" id="checkbox1" data-toggle="checkbox">
                  *) Dicentang ketika buku hilang
                </label><br><br>
                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-plus-sign"></span> Kembali</button>

        </form>
            
            </div>
      </div>
    </div>
      
  </body>
  
  <!--<body>
    <div class="container">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <div class="panel-title"><h1>Form Pengembalian Buku</h1></div>
        </div>
        <div class="panel-body">
          <%--
            echo anchor("the_sociolib/dataPeminjaman", "<span class='glyphicon glyphicon-hand-left'></span> Kembali", array('class' => 'btn btn-default'));
            $a = array('id' => 'form' );
            echo "<br><br>".form_open("the_sociolib/postKembali/{$query[0]->id}/{$telat}/false", $a);

            echo "<div style='display:none'>";
            $a=array('name' => 'id_buku', 'class' => 'form-control', 'value' => $query[0]->id_buku);
            echo '<label>Nama :</label>'.form_input($a)."<br>";
            $a=array('name' => 'id_anggota', 'class' => 'form-control', 'value' => $query[0]->id_anggota);
            echo '<label>Judul :</label>'.form_input($a)."<br>";
            $a=array('name' => 'nama', 'class' => 'form-control', 'value' => $query[0]->nama);
            echo '<label>Nama :</label>'.form_input($a)."<br>";
            $a=array('name' => 'judul', 'class' => 'form-control', 'value' => $query[0]->judul);
            echo '<label>Judul :</label>'.form_input($a)."<br>";
            $a=array('name' => 'tgl_pinjam', 'class' => 'form-control', 'value' => $query[0]->tgl_pinjam);
            echo '<label>Tanggal Pinjam :</label>'.form_input($a)."<br>";
            echo "</div>";

            $a="<p class='form-control-static'>".$query[0]->nama."</p>";
            echo '<label>Nama :</label>'.$a."<br>";
            $a="<p class='form-control-static'>".$query[0]->judul."</p>";
            echo '<label>Judul :</label>'.$a."<br>";
            $a="<p class='form-control-static'>".$query[0]->tgl_pinjam."</p>";
            echo '<label>Tanggal Pinjam :</label>'.$a."<br>";

            echo '<label>Buku Hilang :  </label> ';
            // echo '<label class="checkbox-inline">
            // <input type="checkbox" id="check" value="" name="harga" onclick="tes();">*) Dicentang ketika buku hilang
            // </label><br><br>';
            echo '<label class="checkbox ct-red" id="check" for="checkbox1">
              <input type="checkbox" value="" id="checkbox1" data-toggle="checkbox">
              *) Dicentang ketika buku hilang
            </label><br><br>';
            // var_dump($query[0]->harga);
            echo '<button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-plus-sign"></span> Kembali</button>';
          --%>
        </div>
      </div>
    </div>
  </body>-->
</html>
