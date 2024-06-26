// Source code is decompiled from a .class file using FernFlower decompiler.
package Controller.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet({"/CheckCookieServlet"})
public class CheckCookieServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public CheckCookieServlet() {
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("CheckCookieServlet has been hit");
      HttpSession session = request.getSession(false);
      if (session != null && session.getAttribute("user_mail") != null) {
         System.out.println("CheckCookieServlet has been hit for profile.jsp");
         response.sendRedirect(request.getContextPath() + "/pages/profile.jsp");
      } else {
         response.sendRedirect(request.getContextPath() + "/login.jsp");
      }
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      this.doGet(request, response);
   }
}
