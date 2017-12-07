<%@page import="com.project.entity.AnggotaModel"%>
<a href="tabelViewAnggota.jsp"></a>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      document.getElementById("anggota").className="active";
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
      background: linear-gradient(to right, rgba(255, 255, 255, 0.9) 12%,  rgba(255, 255, 255, 0.5) 50%, rgba(255, 255, 255, 0) 90%), url('/Project_Library/assets/img/pattern-3.jpg');
    }
  </style>
  <body onload="activator()">
    <div class="wrapper">
      <div class="sidebar" id="side" data-color="blue" data-image="/Project_Library/assets/img/sidebar-6.jpg">
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
                    <a class="navbar-brand" href="#">
                     Data Anggota
                    </a>
                </div>
                <div class="collapse navbar-collapse">

                </div>
            </div>
        </nav>
        <div class="content">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <c:if test="${userSession.getLevel() == 1}">
                  <div class="header">
                      <!-- <h4 class="title">Striped Table with Hover</h4> -->
                      <p class="title">
                        <a href="/Project_Library/anggota/add" class = 'btn btn-primary'><span class='glyphicon glyphicon-plus-sign'></span> Tambah Data</a>
                      </p>
                  </div>
                  </c:if>
                    <div class="table-responsive <c:if test="${userSession.getLevel() == 1}">content table-full-width</c:if>">
                        <table class="table table-hover table-striped">
                          <thead>
                          <th>#</th>
                          <th>Nama</th>
                          <th>Gender</th>
                          <th>Alamat</th>
                          <th>Nomor HP</th>
                         </thead><tbody>
                         <c:forEach items="${list}" var="anggotaModel" >
                          <tr>
                            <%
                                AnggotaModel anggotaModel = new AnggotaModel();
                                anggotaModel = (AnggotaModel) pageContext.getAttribute("anggotaModel");
                                String gender = (anggotaModel.getGender().equals("L")) ? "Laki-laki" : "Perempuan";
                            %>
                            <td><%= anggotaModel.getId() %></td>
                            <td><%= anggotaModel.getNama() %></td>
                            <td><%= gender %></td>
                            <td><%= anggotaModel.getAlamat() %></td>
                            <td><%= anggotaModel.getNo_hp() %></td>
                            <c:if test="${userSession.getLevel() == 1}">
                                <td><a href="/Project_Library/anggota/update?id=<%= anggotaModel.getId() %>" class='btn btn-info'><span class='glyphicon glyphicon-edit'></span> Edit</td>
                            </c:if>
                          </tr>
                         </c:forEach>
                       </tbody></table><br>

                  </div>
                </div>
              </div>
            </div>
            <!-- content -->
          </div>
          <!-- Container-Fluid -->
        </div>

      </div>
      <!-- main panel -->
    </div>
    <!-- Wrapper -->
  </body>
</html>
