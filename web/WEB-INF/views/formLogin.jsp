<%-- 
    Document   : formLogin
    Created on : Jul 6, 2017, 10:33:57 AM
    Author     : Ahmada Yusril
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
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
        
    </style>
    <body class="container" style="width:400px;">
        <h1 class="page-header">Halaman Login</h1>
        <form class="panel panel-primary" action="" method="post" style="padding:15px;">
            <fieldset>
                Username:<br><input class="form-control" type="text"  name="user_id"><br>
                Password:<br><input class="form-control" type="password" name="user_pwd"><br>
                <!--<input name="level" type="text" hidden>-->
                <button class="btn btn-primary" type="submit">Login</button> <!--Belum punya akun? <a href="formDaftar.php">Daftar</a>-->
            </fieldset>
        </form>
    </body>
</html>
