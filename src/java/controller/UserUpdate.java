
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
import model.UserUpdateAuthenticator;

@WebServlet(name = "UserUpdate", urlPatterns = {"/UserUpdate"})
public class UserUpdate extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //HttpSession sesion=request.getSession(true);
        //String FirstName=sesion.getAttribute("fname").toString();
        //String LastName=sesion.getAttribute("lname").toString();
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String postalCode=request.getParameter("pc");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String city=request.getParameter("city");
        String country=request.getParameter("country");
        String bio=request.getParameter("bio");
        String username1=request.getParameter("username1");
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        String loginAs=(String)session.getAttribute("loginAs");
        PrintWriter out=response.getWriter();
        boolean update=false;
        UserUpdateAuthenticator ua=new UserUpdateAuthenticator();
        try
        {
        update=ua.isUpdate(fname, lname, postalCode, email, phone, address, city, country, bio, username,username1);
        }
        catch(SQLException e)
        {
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script>");
                    out.println("alert('Update Failed..! Try with Different Username');");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script>");
                    out.println("alert('Update Failed..! Try with Different Username');");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script>");
                    out.println("alert('Update Failed..! Try with Different Username');");
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
                    out.println("alert('Update Failed..!");
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
