<%--
    Document   : index
    Created on : Jun 10, 2017, 10:34:49 PM
    Author     : Diknas 113
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>O-Perpus</title>
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
    <style type="text/css">
        body{
            animation: colorchange 50s;
            -webkit-animation: colorchange 50s;
            animation-iteration-count: infinite;
            -webkit-animation-iteration-count: infinite;
        }
        
        @keyframes colorchange{
            0% {background: #1f77d0 ;}
            10% {background: #87cb16 ;}
            20% {background: #ffa534 ;}
            30% {background: #fb404b ;}
            40% {background: #1dc7ea ;}
            50% {background: #533ce1 ;}
            60% {background: #6dc030 ;}
            70% {background: #ff5221 ;}
            80% {background: #bb0502 ;}
            90% {background: #4091ff ;}
            100% {background: #1f77d0 ;}
        }
        
        @-webkit-keyframes colorchange{
            0% {background: #1f77d0 ;}
            10% {background: #87cb16 ;}
            20% {background: #ffa534 ;}
            30% {background: #fb404b ;}
            40% {background: #1dc7ea ;}
            50% {background: #533ce1 ;}
            60% {background: #6dc030 ;}
            70% {background: #ff5221 ;}
            80% {background: #bb0502 ;}
            90% {background: #4091ff ;}
            100% {background: #1f77d0 ;}
        }
        .page-header {border-bottom-color: gray;}
        .well {background-color: rgba(255,255,255,0.4); margin-top: 20px; border: 0px;}
    </style>
    <body class="container">
        <div class="row well">
        <div class="col-md-8">
            <h1 class="page-header">Tentang O-Perpus</h1>
            <p align="left">O-PERPUS merupakan sebuah aplikasi yang menerapkan Spring dan JPA atau Java Persistence API. O-PERPUS menyediakan jasa PERPUS berbasis Online yang memiliki fitur untuk menambahkan anggota dan informasi detail dari buku yang ada di Perpustakaan.</p>
            <p align="left"> Kemudian juga terdapat informasi detail Denda para anggota jika terlambat dalam Pengembalian Buku. Selain itu dengan Aplikasi O-PERPUS dapat diketahui gimana grafik yang telah dikategorikan berdasarkan Jumlah Peminjaman. </p>
        </div>
        <div class="col-md-4">
        <h1 class="page-header">Form Login</h1>
        <form class="panel panel-primary" action="" method="post" style="padding:15px;">
            <fieldset>
                Username:<br><input class="form-control" type="text"  name="user_id"><br>
                Password:<br><input class="form-control" type="password" name="user_pwd"><br>
                <!--<input name="level" type="text" hidden>-->
                <button class="btn btn-primary" type="submit">Login</button><a href="buku">  Atau Langsung Masuk Tanpa User</a>
            </fieldset>
        </form>
        </div>
        </div>
    </body>
</html>