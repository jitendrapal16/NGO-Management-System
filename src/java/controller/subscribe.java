
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
import model.SubscribeAuthenticator;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "subscribe", urlPatterns = {"/subscribe"})
public class subscribe extends HttpServlet {

    
  public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String email=request.getParameter("emailId");
        PrintWriter out=response.getWriter();
        SubscribeAuthenticator sa=new SubscribeAuthenticator();
        boolean subscribe=false;
        try
        {
        subscribe=sa.isSubscribe(email);
        }
        catch(SQLException e)
        {
           out.println("<script>");
           out.println("alert('News Subscription Failed');");
           out.println("location='index.html'");
           out.println("</script>");
            //out.println("Exception Occured :"+e);
        }
        if(subscribe)
        {
           out.println("<script>");
           out.println("alert('News Subscription Added');");
           out.println("location='index.html'");
           out.println("</script>");
        }
        else
        {
           out.println("<script>");
           out.println("alert('News Subscription Failed');");
           out.println("location='index.html'");
           out.println("</script>");
        }

    }

}
