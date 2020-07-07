
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.RenewMemberAuthenticator;

@WebServlet(name = "RenewMemberChecker", urlPatterns = {"/RenewMemberChecker"})
public class RenewMemberChecker extends HttpServlet {

       
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
         response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        RenewMemberAuthenticator dm=new RenewMemberAuthenticator();
        boolean paid=false;
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        //String loginAs=(String)session.getAttribute("loginAs");
        String charge=request.getParameter("charge");
        
            try
            {
            paid=dm.isMember(charge,username);
            }
            catch(SQLException e)
            {
                //out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Payment Failed !')");
                out.println("location='/minorProject/Member/membership.jsp';");
                out.println("</script>");
            }
        
        if(paid)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
                 out.println("<script type=\"text/javascript\">");
                out.println("alert('Payment Successful !')");
                out.println("location='/minorProject/Member/membership.jsp';");
                out.println("</script>");
        }
        else
        {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Payment Failed !')");
                out.println("location='/minorProject/Member/membership.jsp';");
                out.println("</script>");
        }
    }
}
