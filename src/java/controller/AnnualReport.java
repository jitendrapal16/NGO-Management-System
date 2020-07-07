
package controller;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AnnualReportAuthenticator;


@WebServlet(name = "AnnualReport", urlPatterns = {"/AnnualReport"})
public class AnnualReport extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {

        PrintWriter out = response.getWriter();
      // out.println("file uploaded Successfully ");
        
       String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/annualReport";
       int maxDataSize=20*1024*1024;// 10 MB size of data can be upload
       MultipartRequest mr=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       Enumeration files=mr.getFileNames();
       String name=(String)files.nextElement();
       String filename=mr.getFilesystemName(name);
        AnnualReportAuthenticator ar=new AnnualReportAuthenticator();
        boolean annualReport=false;
        String year=mr.getParameter("year");
            //String root=getServletContext().getRealPath("/passport");
        String annualreport=AnnualReportAuthenticator.getSet(root,filename);
        
            try
            {
            annualReport=ar.isAnnualReport(annualreport,year);
            }
            catch(SQLException e)
            {
                //response.sendRedirect("donate.html");
                out.println("<script>");
                out.println("alert('Annual Report is'nt Upload !')");
                out.println("location='Admin/resource.jsp';");
                out.println("</script>");
                //response.sendRedirect("Admin/resource.jsp");
            } 
        
        
        
        
        if(annualReport)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
                out.println("<script>");
                out.println("alert('Annual Report Uploaded...')");
                out.println("location='Admin/resource.jsp';");
                out.println("</script>");
                //response.sendRedirect("Admin/resource.jsp");
        }
        else
        {
                out.println("<script>");
                out.println("alert('Annual Report is'nt Upload !')");
                out.println("location='Admin/resource.jsp';");
                out.println("</script>");
                //response.sendRedirect("Admin/resource.jsp");
        }
    }
}
