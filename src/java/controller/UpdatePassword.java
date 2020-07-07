
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
import model.UpdatePasswordAuthenticator;

@WebServlet(name = "UpdatePassword", urlPatterns = {"/UpdatePassword"})
public class UpdatePassword extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        String currentPassword=request.getParameter("currentPassword");
        String newPassword=request.getParameter("newPassword");
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        String loginAs=(String)session.getAttribute("loginAs");
        PrintWriter out=response.getWriter();
        boolean update=false;
        UpdatePasswordAuthenticator up=new UpdatePasswordAuthenticator();
        try
        {
        update=up.isUpdate(currentPassword, newPassword, username);
        }
        catch(SQLException e)
        {
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script>");
                    out.println("alert('Update Failed..! Try with different Password');");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script>");
                    out.println("alert('Update Failed..! Try with different Password');");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script>");
                    out.println("alert('Update Failed..! Try with different Password');");
                    out.println("location='/minorProject/Admin/user.jsp';");
                    out.println("</script>");
                    break;
            }
        }
        if(update)
        {
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script>");
                    out.println("alert('Updated..');");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("index.html");
                    break;
                case "Member":
                    out.println("<script>");
                    out.println("alert('Updated..');");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("index.html");
                    break;
                default:
                    out.println("<script>");
                    out.println("alert('Updated..');");
                    out.println("location='/minorProject/Admin/user.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("index.html");   
                    break;
            }
        }
        else
        {
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script>");
                    out.println("alert('Update Failed..!');");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script>");
                    out.println("alert('Update Failed..!');");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script>");
                    out.println("alert('Update Failed..!');");
                    out.println("location='/minorProject/Admin/user.jsp';");
                    out.println("</script>");
                    break;
            }
        }

    }


}
