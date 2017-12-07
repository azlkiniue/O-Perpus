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
  <!-- <script>
    $(document).ready(function(){
      $('.modal').appendTo("body");
    });
  </script> -->
  <style>
  .navbar-collapse [class^="fa"] {
    float: left;
    font-size: 20px;
    margin-right: 10px;
  }
  .sidebar .nav > li.contributor {
    position: absolute;
    width: 100%;
    bottom: 10px;
  }
  .navbar.navbar-default{
    background: linear-gradient(to right, rgba(255, 255, 255, 0.95) 12%,  rgba(255, 255, 255, 0.5) 50%, rgba(255, 255, 255, 0.3) 90%), url('/Project_Library/assets/img/pattern-9.jpg');
  }
  </style>
  <body>
    <div class="wrapper">
      <div class="sidebar" id="side" data-color="red" data-image="/Project_Library/assets/img/sidebar-6.jpg">
        <!--

          Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
          Tip 2: you can also add an image using data-image tag

        -->
      	<%@ include file = "sidebar.jsp" %>
      </div>
      <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=""><!--#navigation-example-2-->
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Daftar Denda</a>
                </div>
                <div class="collapse navbar-collapse">

                </div>
            </div>
        </nav>
        <div class="content">
          <div class="container-fluid">
            <div class="card">
              <div class="table-responsive">
                <%
                  out.println ('<table class="table table-hover table-striped">
                  <thead>');
                  out.println ("<th>#</th>
                  <th>Nama Peminjam</th>
                  <th>Buku yang Dipinjam</th>
                  <th>Jenis Denda</th>
                  <th>Biaya</th>
                  <th class='text-center'>Pembayaran</th>");
                  out.println ('</thead><tbody>');
                foreach ($query as $row) {
                  $denda = ($row->jenis_denda) ? "Buku Hilang" : "Terlambat" ;
                  out.println ("<tr>");
                  out.println ("<td>".$row->no_transaksi."</td>");
                  out.println ("<td>".$row->nama."</td>");
                  out.println ("<td>".$row->judul."</td>");
                  out.println ("<td>".$denda."</td>");
                  out.println ("<td>".$row->biaya."</td><td class='text-center'>");
                  if($row->bayar<$row->biaya){
                  out.println ('<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal'.$row->no_transaksi.'">Bayar</button>');}
                  else{
                  out.println ("<p class='text-success'>Lunas</p>";)}
                  out.println ("</td></tr>");%>
                  <!-- Modal -->
                  <div id="myModal<% out.println($row->no_transaksi); %>" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                      <!-- Modal content-->
                      <div class="modal-content card">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Konfirmasi</h4>
                        </div>
                        <div class="modal-body"><%
                          out.println ('<form id="modal_form'.$row->no_transaksi.'" action="http://localhost/CodeIgniter-2.2.6/index.php/the_sociolib/postBayarDenda/'.$row->no_transaksi.'" method="post">');
                          $a=array('name' => 'bayar', 'class' => 'form-control');
                          out.println ('<label>Nominal Pembayaran :</label><br>'.form_input($a)."<br></form>");
                        %></div>
                        <div class="modal-footer">
                          <button onclick="form_submit(<% echo $row->no_transaksi; %>)" class="btn btn-success btn-fill">Bayar</button>
                          <% //echo anchor("the_sociolib/postBayarDenda/{$row->no_transaksi}", "Bayar", array('class' => 'btn btn-success'));
                          %>
                          <button type="button" class="btn btn-warning" data-dismiss="modal">Batal</button>
                        </div>
                      </div></div></div> <%
                }
                out.println ("</tbody></table>");
                %>
                <script type="text/javascript">
                  function form_submit(no) {
                    document.getElementById("modal_form"+no).submit();
                   }
                </script>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
