<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.Duration"%>
<%@page import="java.time.Period"%>
<%@page import="org.springframework.format.datetime.joda.LocalDateParser"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.project.entity.PeminjamanDetailModel"%>
<%@page import="com.project.entity.PeminjamanMasterModel"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.project.models.Peminjaman"%>
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
  <script>
    function activator(){
      document.getElementById("peminjaman").className="active";
    }
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
    background: linear-gradient(to right, rgba(255, 255, 255, 0.9) 12%,  rgba(255, 255, 255, 0.5) 50%, rgba(255, 255, 255, 0) 90%), url('/Project_Library/assets/img/pattern-4.png');
  }
  </style>
  <body onload="activator()">
    <div class="wrapper">
      <div class="sidebar" id="side" data-color="orange" data-image="/Project_Library/assets/img/sidebar-6.jpg">
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
                    <a class="navbar-brand" href="#">Daftar Peminjaman</a>
                </div>
                <div class="collapse navbar-collapse">

                </div>
            </div>
        </nav>
        <div class="content">
          <div class="container-fluid">
            <div class="card">
              <c:if test="${not empty userSession}">
              <div class="header">
                <p class="title">
                  <a href="peminjaman/new" class='btn btn-primary'>
                    <span class='glyphicon glyphicon-plus-sign'></span> Peminjaman Baru
                  </a>
                </p>
              </div>
              </c:if>
              <div class="table-responsive <c:if test="${not empty userSession}">content table-full-width</c:if>">
                  <c:set var="peminjaman" value="${list}"/>
                  <%!
                  int telat(String tgl)
                  {
                    LocalDate tgl_pinjam = LocalDate.parse(tgl);
                    LocalDate tgl_kembali = LocalDate.now();
                    int days = (int) ChronoUnit.DAYS.between(tgl_pinjam, tgl_kembali);
                    return days; //menampilkan jumlah hari peminjaman
                  }
                  %>
                <%
                  List<PeminjamanMasterModel> table = (List<PeminjamanMasterModel>) pageContext.getAttribute("peminjaman");
                  UserModel loggedUser = (UserModel) session.getAttribute("userSession");
                  out.println("<table class='table table-striped'><thead>");
                  out.println("<th>#</th>" +
                    "<th>Nama Peminjam</th>" +
                    "<th>Buku yang Dipinjam</th>" +
                    "<th class='text-center'>Tanggal Peminjaman</th>" +
                    "<th class='text-center'>Pengembalian</th>");
                  out.println("</thead><tbody>");
                  for (PeminjamanMasterModel rows : table) {
                    Iterator<PeminjamanDetailModel> iter = rows.getPeminjamanDetailModels().iterator();
//                    $testTelat=telat($row->tgl_pinjam);
                    while(iter.hasNext()){
                        String telatStatus = telat(rows.getTgl_pinjam()) > 14 ? String.valueOf(telat(rows.getTgl_pinjam())) : "false";
                        PeminjamanDetailModel row = iter.next();
                        out.println("<tr>");
                        out.println("<td>" + row.getId() + "</td>");
                        out.println("<td>" + rows.getAnggotaModel().getNama() + "</td>");
                        out.println("<td>" + row.getBukuModel().getJudul() + "</td>");
                        out.println("<td class='text-center'>"+rows.getTgl_pinjam()+"</td>");
                        if(row.getTgl_kembali()==null){
                            out.println("<td class='text-center'>");
                            if(loggedUser != null)
                                if(loggedUser.getLevel() == 1)
                                    out.println("<a href='peminjaman/kembali?id="+ row.getId() +"&telat=" + telatStatus + "' class='btn btn-info')><span class='glyphicon glyphicon-hand-right'></span> Kembali</a>");
                                else out.println("Telat: "+(14-telat(rows.getTgl_pinjam()))+" hari lagi");
                            else out.println("Telat: "+(14-telat(rows.getTgl_pinjam()))+" hari lagi");
                            out.println("</td>");}
                        else out.println ("<td class='text-center'>"+row.getTgl_kembali()+"</td>");
                        out.println("</tr>");
                    }
                  }
                  out.println("</tbody></table><br>");
                %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
