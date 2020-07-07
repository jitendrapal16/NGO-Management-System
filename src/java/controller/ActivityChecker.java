
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
import model.ActivityAuthenticator;

@WebServlet(name = "ActivityChecker", urlPatterns = {"/ActivityChecker"})
public class ActivityChecker extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
                response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
       
        PrintWriter out = response.getWriter();
        ActivityAuthenticator aa=new ActivityAuthenticator();
        boolean activity=false;
        String eventName=request.getParameter("events");
        String location=request.getParameter("locate");
        String eventOn=request.getParameter("eventOn");
        
        
            try
            {
            activity=aa.isActivity(eventName, location, eventOn);
            }
            catch(SQLException | ParseException e)
            {
                //out.println("alert('Donation Failed !')");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Activity Upload Failed !')");
                out.println("location='/minorProject/Admin/happen.jsp';");
                out.println("</script>");
                //response.sendRedirect("/minorProject/Admin/happen.jsp");
            }
        
       
        if(activity)
        {
            
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Activity Uploaded...')");
            out.println("location='/minorProject/Admin/happen.jsp';");
            out.println("</script>");
            //response.sendRedirect("index.html");
            //out.println("alert(Donation Completed...)");
        }
        else
        {
            response.sendRedirect("/minorProject/Admin/happen.jsp");
        }
    }
}
