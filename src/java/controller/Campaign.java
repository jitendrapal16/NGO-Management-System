
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
import model.CampaignAuthenticator;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "Campaign", urlPatterns = {"/Campaign"})
public class Campaign extends HttpServlet {

    
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
        
       String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/campaign";
       int maxDataSize=10*1024*1024;// 10 MB size of data can be upload
       MultipartRequest mr=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       Enumeration files=mr.getFileNames();
       String name=(String)files.nextElement();
       String filename=mr.getFilesystemName(name);
       CampaignAuthenticator ca=new CampaignAuthenticator();
       boolean raised=false;
       
            String campName=mr.getParameter("name");
            String description=mr.getParameter("description");
            String type=mr.getParameter("type");
            String goalAmt=mr.getParameter("g_amt");
            String imgLocalPath=CampaignAuthenticator.getSet(root,filename);
            try
            {
            raised=ca.isRaised(campName, description, type, goalAmt, imgLocalPath);
            }
            catch(SQLException |ParseException e)
            {
               response.sendRedirect("/minorProject/Admin/campaign.jsp");
            } 
            
        if(raised)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            response.sendRedirect("/minorProject/Admin/campaign.jsp");
            //out.println("Donation Completed...");
        }
        else
        {
            //response.sendRedirect("donate.html");
        }
    }
    
}
