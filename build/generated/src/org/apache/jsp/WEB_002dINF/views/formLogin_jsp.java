package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class formLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Login</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"/Project_Library/assets/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"/Project_Library/assets/css/light-bootstrap-dashboard.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"/Project_Library/assets/css/animate.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"/Project_Library/assets/font-awesome/css/font-awesome.min.css\">\n");
      out.write("        <!-- <link rel=\"stylesheet\" href=\"<?php echo base_url(\"assets/css/pe-icon-7-stroke.css\") ?>\"> -->\n");
      out.write("        <script src=\"/Project_Library/assets/js/jquery-1.12.4.js\"></script>\n");
      out.write("        <script src=\"/Project_Library/assets/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"/Project_Library/assets/js/light-bootstrap-dashboard.js\"></script>\n");
      out.write("        <script src=\"/Project_Library/assets/js/bootstrap-checkbox-radio-switch.js\"></script>\n");
      out.write("        <script src=\"/Project_Library/assets/js/bootstrap-notify.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("    </style>\n");
      out.write("    <body class=\"container\" style=\"width:400px;\">\n");
      out.write("        <h1 class=\"page-header\">Halaman Login</h1>\n");
      out.write("        <form class=\"panel panel-primary\" action=\"\" method=\"post\" style=\"padding:15px;\">\n");
      out.write("            <fieldset>\n");
      out.write("                Username:<br><input class=\"form-control\" type=\"text\"  name=\"user_id\"><br>\n");
      out.write("                Password:<br><input class=\"form-control\" type=\"password\" name=\"user_pwd\"><br>\n");
      out.write("                <!--<input name=\"level\" type=\"text\" hidden>-->\n");
      out.write("                <button class=\"btn btn-primary\" type=\"submit\">Login</button> <!--Belum punya akun? <a href=\"formDaftar.php\">Daftar</a>-->\n");
      out.write("            </fieldset>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
