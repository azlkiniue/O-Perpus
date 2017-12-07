<%@page import="com.project.entity.UserModel"%>
<div class="sidebar-wrapper">
      <div class="logo">
          <a href="" class="simple-text">
              Social Library
          </a>
      </div>
      <ul class="nav">
          <li id="buku" class="">
            <a href="/Project_Library/buku">
              <i class="fa fa-fw fa-book"></i>
              <p>Buku</p>
            </a>
          </li>
          <li id="anggota" class="">
            <a href="/Project_Library/anggota">
              <i class="fa fa-fw fa-users"></i>
              <p>Anggota</p>
            </a>
          </li>
          <li id="peminjaman" class="">
            <a href="/Project_Library/peminjaman">
              <i class="fa fa-fw fa-address-book"></i>
              <p>Peminjaman</p>
            </a>
          </li>
          <li id="denda" class="">
            <a href="/Project_Library/denda">
              <i class="fa fa-fw fa-money"></i>
              <p>Denda</p>
            </a>
          </li>
          <li id="statistik" class="">
            <a href="/Project_Library/statistik">
               <i class="fa fa-fw fa-line-chart"></i>
              <p>Statistik</p>
            </a>
          </li>
          <li class="contributor">            
            <% 
                UserModel user = null;
                user = (UserModel) session.getAttribute("userSession");
            %>
            <a href="/Project_Library/<% if(user==null) out.print("login"); else out.print("login/_out"); %>">
              <i class="fa fa-fw fa-trophy"></i>
              <p><% if(user==null) out.print("login"); else out.print("Logout ("+user.getUser_id()+")"); %></p>
            </a>
          </li>
      </ul>
</div>