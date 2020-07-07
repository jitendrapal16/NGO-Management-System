
package controller;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DonateCampAuthenticator;

@WebServlet(name = "DonateCampCheckerMultipart", urlPatterns = {"/DonateCampCheckerMultipart"})
public class DonateCampCheckerMultipart extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                //out.println("alert('NOT DELETED, TRY AGAIN!')");
                //out.println("location='ourCampaign/ourCampaign.jsp';");
                out.println("</script>");
                response.sendRedirect("ourCampaign/ourCampaign.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        HttpSession sesion=request.getSession(true);
        String name=sesion.getAttribute("name").toString();
        String donateField=sesion.getAttribute("type").toString();
        PrintWriter out = response.getWriter();
      // out.println("file uploaded Successfully ");
        
       String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/passport";
       int maxDataSize=10*1024*1024;// 10 MB size of data can be upload
       MultipartRequest mr=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       Enumeration files=mr.getFileNames();
       String name1=(String)files.nextElement();
       String filename=mr.getFilesystemName(name1);
        DonateCampAuthenticator da=new DonateCampAuthenticator();
        boolean donate=false;      
        //String root=getServletContext().getRealPath("/passport");
        String passport=DonateCampAuthenticator.getSet(root,filename);
        String amount=mr.getParameter("amt");
        String fullName=mr.getParameter("fname");
        String email=mr.getParameter("email");
        String phone=mr.getParameter("phone");
        String dob=mr.getParameter("dob");
        String address=mr.getParameter("adr");
        String city=mr.getParameter("city");
        String postalCode=mr.getParameter("pc");
        String returnFill=mr.getParameter("returnFilling");
        //String passport=mr.getParameter("pcnum");
        String country=mr.getParameter("countries");
        String state=mr.getParameter("statess");
        
            try
            {
            donate=da.isDonateNRI(fullName, email, phone, dob, address, city, postalCode, passport, country, state, donateField, amount, returnFill,name);
            }
            catch(SQLException | ParseException e)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Donation Failed !')");
                //out.println("location='ourCampaign/ourCampaign.jsp';");
                out.println("</script>");
                response.sendRedirect("ourCampaign/ourCampaign.jsp");
            } 
        
        
        
        
        if(donate)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Donation Completed...')");
            //out.println("location='index.html';");
            out.println("</script>");
            response.sendRedirect("index.html");
        }
        else
        {
            //response.sendRedirect("donate.html");
        }
    }
}
