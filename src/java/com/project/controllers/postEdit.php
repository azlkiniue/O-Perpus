<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Database</title>
      <link rel="stylesheet" href="<?php echo base_url("assets/css/loader.css") ?>" media="screen" title="no title" charset="utf-8">
  </head>
  <style media="screen">
    .container{
      background-color: rgb(91, 192, 222);
      color: white;
    }
  </style>
  <body>
    <body class="container">
      <?php
        header("refresh:1; url=".site_url("the_sociolib/index/{$tipe}"));
      ?>
      <h1>Data berhasil diubah</h1>
      <h3>Redirecting...</h3>
      <div class="content">
      <div class="ball"></div>
      <div class="ball1"></div>
      <div class="ball2"></div>
      <div class="ball3"></div>
      </div>
    </body>
  </body>
</html>
