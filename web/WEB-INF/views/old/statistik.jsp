<html>
  <head>
   <title>Database</title>
   <link rel="stylesheet" href="/Project_Library/assets/css/bootstrap.min.css">
   <link rel="stylesheet" href="/Project_Library/assets/css/morris.css">
   <link rel="stylesheet" href="/Project_Library/assets/css/light-bootstrap-dashboard.css">
   <link rel="stylesheet" href="/Project_Library/assets/css/animate.min.css">
   <link rel="stylesheet" href="/Project_Library/assets/font-awesome/css/font-awesome.min.css">
   <!-- <link rel="stylesheet" href="<?php echo base_url("assets/css/pe-icon-7-stroke.css") ?>"> -->
   <script src="/Project_Library/assets/js/jquery-1.12.4.js"></script>
   <script src="/Project_Library/assets/js/bootstrap.min.js"></script>
   <script src="/Project_Library/assets/js/light-bootstrap-dashboard.js"></script>
   <script src="/Project_Library/assets/js/bootstrap-checkbox-radio-switch.js"></script>
   <script src="/Project_Library/assets/js/bootstrap-notify.js"></script>
   <script src="/Project_Library/assets/js/morris.min.js"></script>
   <script src="/Project_Library/assets/js/raphael.min.js"></script>
   <script src="/Project_Library/assets/js/morris-data.js"></script>

  </head>
  <script>
  $(document).ready(function(){
    $("#pdf").mouseenter(function(){
      var width;
      width = $(".main-panel").width();
      var height;
      height = $(".main-panel").height();
      if (height<400) {
        height+=500;
      }
      // console.log($(".row").height());
      $("#pdf").attr("onclick", "return xepOnline.Formatter.Format('print',{pageWidth:'"+ width +"px', pageHeight:'"+ height +"px'});");
      // console.log(width);
    });
  });
  </script>
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
      background: linear-gradient(to right, rgba(255, 255, 255, 0.9) 12%,  rgba(255, 255, 255, 0.7) 50%, rgba(255, 255, 255, 0.9) 90%), url('/Project_Library/assets/img/pattern-8.jpg');
    }
  </style>
  <body>
    <div class="wrapper">
      <div class="sidebar" id="side" data-color="azure" data-image="/Project_Library/assets/img/sidebar-6.jpg">
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
                    <a class="navbar-brand" href="#">Statistik</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                  <li>
                    <button href="#" id="pdf" class="btn btn-default btn-xs"><i class="fa fa-fw fa-file-pdf-o"></i>Export to PDF</button>
                  </li>
                </ul>
                <div class="collapse navbar-collapse">

                </div>
            </div>
        </nav>
        <div class="content">
          <!-- <img src="http://localhost/img/loader-64x/Preloader_3.gif" class="loading">
          <div class="se-pre-con"></div> -->
          <div id="print" class="container-fluid">
            <!-- <a href="javascript:demoFromHTML()" class="button">Run Code</a> -->
            <div class="row">
              <div class="col-md-5">
                <div class="card">
                  <div class="header">
                    <h4 class="title">Data Anggota Berdasarkan Gender</h4>
                  </div>
                  <div class="content">
                    <div id="morris-donut-chart" ></div>
                    <div class="footer">
                      <div id="legend" class="donut-legend text-center"></div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-7">
                <div class="card">
                  <div class="header">
                    <h4 class="title">Data Peminjaman</h4>
                  </div>
                  <div class="content">
                    <div id="morris-line-chart" ></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="card">
                  <div class="header">
                    <h4 class="title">Data Persebaran Umur Anggota</h4>
                  </div>
                  <div class="content">
                    <div id="morris-bar-chart" ></div>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="card">
                  <div class="header">
                    <h4 class="title">Data Pertumbuhan Jumlah Anggota</h4>
                  </div>
                  <div class="content">
                    <div id="morris-area-chart" ></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
