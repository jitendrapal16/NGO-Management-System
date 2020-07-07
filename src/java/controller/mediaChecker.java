/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.mediaAuthenticator;


@WebServlet(name = "mediaChecker", urlPatterns = {"/mediaChecker"})
public class mediaChecker extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        PrintWriter outs = response.getWriter();
        
        mediaAuthenticator ra=new mediaAuthenticator();
        boolean published=false;
        
        String title=request.getParameter("title");
        String description=request.getParameter("description");
        String type=request.getParameter("type");
        String dop=request.getParameter("dop");
        try{
            published=ra.isPublished(title, description, type,dop);
        }
        catch(SQLException | ParseException e){
             outs.println("<script type=\"text/javascript\">");
                outs.println("alert('Media News Publication Failed !')");
                outs.println("location='Admin/media.jsp';");
                outs.println("</script>");
                //response.sendRedirect("Admin/dashboard.jsp");
        }
        if(published)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
                outs.println("<script type=\"text/javascript\">");
                outs.println("alert('Media News Published...')");
                outs.println("location='Admin/media.jsp';");
                outs.println("</script>");
                //response.sendRedirect("Admin/resource.jsp");
        }
        else
        {
            outs.println("<script type=\"text/javascript\">");
                outs.println("alert('Media News Publication Failed !')");
                outs.println("location='Admin/media.jsp';");
                outs.println("</script>");
                //response.sendRedirect("Admin/dashboard.jsp");
        }
    }
}
