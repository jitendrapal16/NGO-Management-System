
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
import model.DonateAuthenticator;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "DonateCheckerMultipart1", urlPatterns = {"/DonateCheckerMultipart1"})
public class DonateCheckerMultipart1 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("donate.html");
    }
    
     public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        HttpSession sesion=request.getSession(true);
        String type=sesion.getAttribute("type").toString();
        String amount=sesion.getAttribute("amount").toString();
        PrintWriter out = response.getWriter();
      // out.println("file uploaded Successfully ");
        
       String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/passport";
       int maxDataSize=10*1024*1024;// 10 MB size of data can be upload
       MultipartRequest mr=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       Enumeration files=mr.getFileNames();
       String name=(String)files.nextElement();
       String filename=mr.getFilesystemName(name);
       String donorFrom=mr.getParameter("donorFrom");
       DonateAuthenticator da=new DonateAuthenticator();
       boolean donate=false;
        
    
            String fullName=mr.getParameter("fname");
            String email=mr.getParameter("email");
            String phone=mr.getParameter("phone");
            String dob=mr.getParameter("dob");
            String address=mr.getParameter("adr");
            String city=mr.getParameter("city");
            String postalCode=mr.getParameter("pc");
            //String passport=mr.getParameter("pcnum");
            String country=mr.getParameter("countries");
            String state=mr.getParameter("statess");
            String passport=DonateAuthenticator.getSet(root,filename);
            try
            {
            donate=da.isDonateForeign(fullName, email, phone, dob, address, city, postalCode, passport, country, state, type, amount, donorFrom);
            }
            catch(SQLException |ParseException e)
            {
                out.println("foreignNational "+e);
                //response.sendRedirect("donate.html");
            } 
            
        if(donate)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            response.sendRedirect("index.html");
            out.println("alert(Donation Completed...)");
        }
        else
        {
            //response.sendRedirect("donate.html");
        }
    }
}
