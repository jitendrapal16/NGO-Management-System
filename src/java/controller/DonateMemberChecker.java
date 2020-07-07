
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DonateMemberAuthenticator;

@WebServlet(name = "DonateMemberChecker", urlPatterns = {"/DonateMemberChecker"})
public class DonateMemberChecker extends HttpServlet {
        
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        DonateMemberAuthenticator dm=new DonateMemberAuthenticator();
        boolean donate=false;
        
        String charge=request.getParameter("charge");
        
            try
            {
            donate=dm.isMember(charge);
            }
            catch(SQLException e)
            {
                //out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Payment Failed !')");
                out.println("location='index.html';");
                out.println("</script>");
            }
        
        if(donate)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            response.sendRedirect("Member.jsp");
        }
        else
        {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Payment Failed !')");
                out.println("location='index.html';");
                out.println("</script>");
        }
    }
}
