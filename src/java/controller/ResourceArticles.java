
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ResourceArticlesAuthenticator;



@WebServlet(name = "ResourceArticles", urlPatterns = {"/ResourceArticles"})
public class ResourceArticles extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter outs = response.getWriter();
        
        ResourceArticlesAuthenticator ra=new ResourceArticlesAuthenticator();
        boolean published=false;
        
        String title=request.getParameter("title");
        String description=request.getParameter("description");
        String topic=request.getParameter("topic");
        try{
            published=ra.isPublished(title, description, topic);
        }
        catch(SQLException e){
             outs.println("<script type=\"text/javascript\">");
                outs.println("alert('Article Publication Failed !')");
                outs.println("location='Admin/resource.jsp';");
                outs.println("</script>");
                //response.sendRedirect("Admin/dashboard.jsp");
        }
        if(published)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
                outs.println("<script type=\"text/javascript\">");
                outs.println("alert('Article Published...')");
                outs.println("location='Admin/resource.jsp';");
                outs.println("</script>");
                //response.sendRedirect("Admin/resource.jsp");
        }
        else
        {
            outs.println("<script type=\"text/javascript\">");
                outs.println("alert('Article Publication Failed !')");
                outs.println("location='Admin/resource.jsp';");
                outs.println("</script>");
                //response.sendRedirect("Admin/dashboard.jsp");
        }
    }
}
